CREATE TABLE superblocks(
  id SERIAL PRIMARY KEY,
  dashed_name text
);

CREATE TABLE superblocks_blocks(
  superblock_id int NOT NULL REFERENCES superblocks(id),
  block_id int NOT NULL REFERENCES blocks(id)
);

CREATE TABLE blocks(
  id SERIAL PRIMARY KEY,
  dashed_name text
);

CREATE TABLE blocks_challenges(
  block_id int NOT NULL REFERENCES blocks(id),
  challenge_id int NOT NULL REFERENCES challenges(id)
);

CREATE TABLE challenges(
  id SERIAL PRIMARY KEY,
  dashed_name text NOT NULL
);

CREATE TABLE descriptions(
  id int NOT NULL REFERENCES challenges(id),
  description text NOT NULL
);

CREATE TABLE challenge_files(
  id int NOT NULL REFERENCES challenges(id),
  challenge_files json NOT NULL
);

CREATE TABLE instructions(
  id int NOT NULL REFERENCES challenges(id),
  instruction text NOT NULL
);

CREATE TABLE sentences(
  id int NOT NULL REFERENCES challenges(id),
  sentence text NOT NULL
);