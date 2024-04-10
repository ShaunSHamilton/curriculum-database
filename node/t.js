// TESTING FILE

// import { ApolloClient, InMemoryCache } from "@apollo/client/core/core.cjs";
import { writeFileSync } from "fs";
import { createConnection } from "mysql";
// import { allCertificateNode } from "./graphql-query.js";

// const client = new ApolloClient({
//   uri: "http://localhost:8000/__graphql",
//   cache: new InMemoryCache(),
// });

// const allCertificateData = await client.query({
//   query: allCertificateNode,
// });

// console.log(allCertificateData.data.allCertificateNode.nodes);

const connection = createConnection("mysql://root:@127.0.0.1/curriculum");

connection.connect();

await createDropTablesQueries();

async function createDropTablesQueries() {
  const sql = `show tables;`;
  return new Promise((resolve, reject) => {
    connection.query(sql, (err, result) => {
      if (err) {
        console.error("Error running SQL:\n", sql);
        throw err;
      }
      for (const row of result) {
        const { Tables_in_curriculum } = row;
        const sql = `DROP TABLE IF EXISTS ${Tables_in_curriculum};`;
        writeFileSync(`../queries/drop-tables.sql`, sql + "\n", {
          flag: "a",
        });
      }
      resolve();
    });
  });
}

connection.end();
