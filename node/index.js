import { writeFileSync, rmSync } from "fs";
import apollo from "@apollo/client/core/core.cjs";
import { createConnection } from "mysql";
import { NodeHtmlMarkdown } from "node-html-markdown";
import { query } from "./graphql-query.js";
const { ApolloClient, InMemoryCache, gql } = apollo;

rmSync("../queries/node-log.sql", { force: true });

const client = new ApolloClient({
  uri: "http://localhost:8000/__graphql",
  cache: new InMemoryCache(),
});

const data = await client.query({
  query,
});

// console.log(JSON.stringify(data, null, 2));

const connection = createConnection("mysql://root:@127.0.0.1/curriculum");

connection.connect();

function getTableName(key) {
  return key;
}

function getColumnType(value) {
  switch (typeof value) {
    case "string":
      return "TEXT";
    case "number":
      return "INT";
    case "boolean":
      return "BOOLEAN";
    case "object":
      return "JSON";
    default:
      return "TEXT";
  }
}

async function seed() {
  let sql = `
CREATE TABLE IF NOT EXISTS certifications(
  id INT NOT NULL AUTO_INCREMENT,
  title TEXT NOT NULL,
  object_id VARCHAR(24) NOT NULL,
  slug TEXT,
  state ENUM('current','upcomming','legacy') NOT NULL,
  PRIMARY KEY (id)
);`;
  await runSQL(sql);

  sql = `
CREATE TABLE IF NOT EXISTS certifications_prerequisites(
  certification_id INT NOT NULL,
  prerequisite_object_id VARCHAR(24) NOT NULL,
  PRIMARY KEY (certification_id, prerequisite_object_id),
  FOREIGN KEY (certification_id) REFERENCES certifications(id)
);`;

  sql = `
CREATE TABLE IF NOT EXISTS superblocks(
  id INT NOT NULL AUTO_INCREMENT,
  title TEXT NOT NULL,
  dashed_name TEXT NOT NULL,
  superblock_order INT NOT NULL,
  PRIMARY KEY (id)
);`;
  await runSQL(sql);

  sql = `
CREATE TABLE IF NOT EXISTS blocks(
  id INT NOT NULL AUTO_INCREMENT,
  title TEXT NOT NULL,
  dashed_name TEXT NOT NULL,
  PRIMARY KEY (id)
);`;
  await runSQL(sql);

  sql = `
CREATE TABLE IF NOT EXISTS superblocks_blocks(
  superblock_id INT NOT NULL,
  block_id INT NOT NULL,
  block_order int NOT NULL,
  PRIMARY KEY (superblock_id, block_id),
  FOREIGN KEY (superblock_id) REFERENCES superblocks(id),
  FOREIGN KEY (block_id) REFERENCES blocks(id)
);`;
  await runSQL(sql);

  sql = `
CREATE TABLE IF NOT EXISTS challenges (
  id INT NOT NULL AUTO_INCREMENT,
  title TEXT NOT NULL,
  object_id VARCHAR(24) NOT NULL,
  dashed_name TEXT NOT NULL,
  PRIMARY KEY (id)
);`;
  await runSQL(sql);

  sql = `
CREATE TABLE IF NOT EXISTS blocks_challenges(
  block_id INT NOT NULL,
  challenge_id INT NOT NULL,
  challenge_order int NOT NULL,
  PRIMARY KEY (block_id, challenge_id),
  FOREIGN KEY (block_id) REFERENCES blocks(id),
  FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);`;
  await runSQL(sql);
}

async function createTables(data) {
  const createdTables = [];
  for (const challengeNode of data) {
    // Filter out fields not related to 'feature' tables
    const {
      __typename,
      block,
      certification,
      challengeType,
      challengeOrder,
      dashedName,
      id,
      order,
      superBlock,
      superOrder,

      description,
      time,
      ...challenge
    } = challengeNode.challenge;

    for (const [key, value] of Object.entries(challenge)) {
      // Filter out null values
      if (!value) {
        continue;
      }

      const tableName = getTableName(key);
      const columnType = getColumnType(value);
      let sql = "";
      if (columnType === "BOOLEAN") {
        sql = `
CREATE TABLE IF NOT EXISTS ${tableName} (
  id INT NOT NULL AUTO_INCREMENT,
  challenge_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);`;
      } else {
        sql = `
CREATE TABLE IF NOT EXISTS ${tableName} (
  id INT NOT NULL AUTO_INCREMENT,
  challenge_id INT NOT NULL,
  ${key} ${columnType},
  PRIMARY KEY (id),
  FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);`;
      }
      if (!createdTables.includes(tableName)) {
        createdTables.push(tableName);
        await runSQL(sql);
      }
    }
  }
}

await seed();

// console.log(data.data.allChallengeNode.nodes);
await createTables(data.data.allChallengeNode.nodes);

await addChallenges(data.data.allChallengeNode.nodes);

async function addChallenges(data) {
  const superblockSet = new Set();
  const blockSet = new Set();

  const superblock_to_superblock_id_map = new Map();
  const block_to_block_id_map = new Map();
  let block_id = 1;
  let superblock_id = 1;
  let sql = "";
  let c = 1;
  for (const challengeNode of data) {
    const {
      superBlock,
      superOrder,
      id,
      challengeOrder,
      certification,
      order,
      block,
      title,
      dashedName,

      __typename,
      description,
      time,
      challengeType,
      ...challenge
    } = challengeNode.challenge;
    if (!superblockSet.has(superBlock)) {
      sql = `INSERT INTO superblocks (title, dashed_name, superblock_order) VALUES ('${superBlock}', '${superBlock}', ${superOrder});`;
      await runSQL(sql);
      superblockSet.add(superBlock);
      superblock_to_superblock_id_map.set(superBlock, superblock_id);
      superblock_id += 1;
    }

    if (!blockSet.has(block)) {
      sql = `INSERT INTO blocks (title, dashed_name) VALUES ('${block}', '${block}');`;
      await runSQL(sql);
      blockSet.add(block);
      block_to_block_id_map.set(block, block_id);
      block_id += 1;
    }

    sql = `INSERT INTO challenges (title, object_id, dashed_name) VALUES (?,?,?);`;
    await insert(sql, [title, id, dashedName]);

    if (
      superblock_to_superblock_id_map.get(superBlock) &&
      !block_to_block_id_map.get(block)
    ) {
      const superblockId = superblock_to_superblock_id_map.get(superBlock);
      const blockId = block_to_block_id_map.get(block);
      sql = `INSERT INTO superblocks_blocks (superblock_id, block_id, block_order) VALUES (${superblockId}, ${blockId}, ${order});`;
      await runSQL(sql);
    }

    if (block_to_block_id_map.get(block)) {
      const blockId = block_to_block_id_map.get(block);
      sql = `INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (${blockId}, ${c}, ${challengeOrder});`;
      await runSQL(sql);
    }

    // Add to feature tables
    for (const [key, value] of Object.entries(challenge)) {
      const tableName = getTableName(key);
      if (!value || value?.length === 0) {
        continue;
      }
      const columnType = getColumnType(value);
      const values = [];
      switch (columnType) {
        case "BOOLEAN":
          if (value) {
            values.push(c);
            sql = `INSERT INTO ${tableName} (challenge_id) VALUES (?);`;
          } else {
            continue;
          }
          break;
        case "JSON":
          values.push(c, JSON.stringify(value));
          sql = `INSERT INTO ${tableName} (challenge_id, ${key}) VALUES (?,?);`;
          break;
        case "INT":
          values.push(c, value);
          sql = `INSERT INTO ${tableName} (challenge_id, ${key}) VALUES (?,?);`;
          break;
        case "TEXT":
          values.push(c, NodeHtmlMarkdown.translate(value));
          sql = `INSERT INTO ${tableName} (challenge_id, ${key}) VALUES (?,?);`;
          break;
        default:
          values.push(c, value);
          sql = `INSERT INTO ${tableName} (challenge_id, ${key}) VALUES (?,?);`;
          break;
      }

      await insert(sql, values);
    }
    c += 1;
  }
}

connection.end();

async function runSQL(sql) {
  writeFileSync("../queries/node-log.sql", "\n" + sql + "\n", { flag: "as" });
  return new Promise((resolve, reject) => {
    connection.query(sql, (err, result) => {
      if (err) {
        throw err;
      } else {
        // console.log(result);
      }
      resolve();
    });
  });
}

async function insert(sql, values) {
  return new Promise((resolve, reject) => {
    connection.query(sql, values, (err, result) => {
      if (err) {
        throw err;
      } else {
        // console.log(result);
      }
      resolve();
    });
  });
}
