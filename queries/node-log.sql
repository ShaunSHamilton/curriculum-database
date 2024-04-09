

CREATE TABLE IF NOT EXISTS certifications(
  id INT NOT NULL AUTO_INCREMENT,
  title TEXT NOT NULL,
  object_id VARCHAR(24) NOT NULL,
  slug TEXT,
  state ENUM('current','upcomming','legacy') NOT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS superblocks(
  id INT NOT NULL AUTO_INCREMENT,
  title TEXT NOT NULL,
  dashed_name TEXT NOT NULL,
  superblock_order INT NOT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS blocks(
  id INT NOT NULL AUTO_INCREMENT,
  title TEXT NOT NULL,
  dashed_name TEXT NOT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS superblocks_blocks(
  superblock_id INT NOT NULL,
  block_id INT NOT NULL,
  block_order int NOT NULL,
  PRIMARY KEY (superblock_id, block_id),
  FOREIGN KEY (superblock_id) REFERENCES superblocks(id),
  FOREIGN KEY (block_id) REFERENCES blocks(id)
);


CREATE TABLE IF NOT EXISTS challenges (
  id INT NOT NULL AUTO_INCREMENT,
  title TEXT NOT NULL,
  object_id VARCHAR(24) NOT NULL,
  dashed_name TEXT NOT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS blocks_challenges(
  block_id INT NOT NULL,
  challenge_id INT NOT NULL,
  challenge_order int NOT NULL,
  PRIMARY KEY (block_id, challenge_id),
  FOREIGN KEY (block_id) REFERENCES blocks(id),
  FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);


CREATE TABLE IF NOT EXISTS assignments (
  id INT NOT NULL AUTO_INCREMENT,
  challenge_id INT NOT NULL,
  assignments JSON,
  PRIMARY KEY (id),
  FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);


CREATE TABLE IF NOT EXISTS challengeFiles (
  id INT NOT NULL AUTO_INCREMENT,
  challenge_id INT NOT NULL,
  challengeFiles JSON,
  PRIMARY KEY (id),
  FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);


CREATE TABLE IF NOT EXISTS fields (
  id INT NOT NULL AUTO_INCREMENT,
  challenge_id INT NOT NULL,
  fields JSON,
  PRIMARY KEY (id),
  FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);


CREATE TABLE IF NOT EXISTS forumTopicId (
  id INT NOT NULL AUTO_INCREMENT,
  challenge_id INT NOT NULL,
  forumTopicId INT,
  PRIMARY KEY (id),
  FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);


CREATE TABLE IF NOT EXISTS helpCategory (
  id INT NOT NULL AUTO_INCREMENT,
  challenge_id INT NOT NULL,
  helpCategory TEXT,
  PRIMARY KEY (id),
  FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);


CREATE TABLE IF NOT EXISTS instructions (
  id INT NOT NULL AUTO_INCREMENT,
  challenge_id INT NOT NULL,
  instructions TEXT,
  PRIMARY KEY (id),
  FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);


CREATE TABLE IF NOT EXISTS removeComments (
  id INT NOT NULL AUTO_INCREMENT,
  challenge_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);


CREATE TABLE IF NOT EXISTS required (
  id INT NOT NULL AUTO_INCREMENT,
  challenge_id INT NOT NULL,
  required JSON,
  PRIMARY KEY (id),
  FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);


CREATE TABLE IF NOT EXISTS solutions (
  id INT NOT NULL AUTO_INCREMENT,
  challenge_id INT NOT NULL,
  solutions JSON,
  PRIMARY KEY (id),
  FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);


CREATE TABLE IF NOT EXISTS tests (
  id INT NOT NULL AUTO_INCREMENT,
  challenge_id INT NOT NULL,
  tests JSON,
  PRIMARY KEY (id),
  FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);


CREATE TABLE IF NOT EXISTS title (
  id INT NOT NULL AUTO_INCREMENT,
  challenge_id INT NOT NULL,
  title TEXT,
  PRIMARY KEY (id),
  FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);


CREATE TABLE IF NOT EXISTS videoUrl (
  id INT NOT NULL AUTO_INCREMENT,
  challenge_id INT NOT NULL,
  videoUrl TEXT,
  PRIMARY KEY (id),
  FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);


CREATE TABLE IF NOT EXISTS template (
  id INT NOT NULL AUTO_INCREMENT,
  challenge_id INT NOT NULL,
  template TEXT,
  PRIMARY KEY (id),
  FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);


CREATE TABLE IF NOT EXISTS hasEditableBoundaries (
  id INT NOT NULL AUTO_INCREMENT,
  challenge_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);


CREATE TABLE IF NOT EXISTS usesMultifileEditor (
  id INT NOT NULL AUTO_INCREMENT,
  challenge_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);

INSERT INTO superblocks (title, dashed_name, superblock_order) VALUES ('responsive-web-design', 'responsive-web-design', 18);

INSERT INTO blocks (title, dashed_name) VALUES ('applied-accessibility', 'applied-accessibility');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 1, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 2, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 3, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 4, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 5, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 6, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 7, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 8, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 9, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 10, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 11, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 12, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 13, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 14, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 15, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 16, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 17, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 18, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 19, 20);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 20, 21);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 21, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (1, 22, 11);

INSERT INTO blocks (title, dashed_name) VALUES ('applied-visual-design', 'applied-visual-design');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 23, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 24, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 25, 27);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 26, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 27, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 28, 28);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 29, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 30, 29);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 31, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 32, 46);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 33, 44);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 34, 47);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 35, 24);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 36, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 37, 48);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 38, 23);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 39, 30);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 40, 37);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 41, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 42, 38);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 43, 42);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 44, 32);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 45, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 46, 43);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 47, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 48, 25);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 49, 26);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 50, 49);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 51, 39);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 52, 20);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 53, 21);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 54, 45);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 55, 51);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 56, 41);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 57, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 58, 22);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 59, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 60, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 61, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 62, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 63, 50);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 64, 31);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 65, 40);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 66, 35);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 67, 36);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 68, 33);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 69, 34);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 70, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 71, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 72, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 73, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (2, 74, 4);

INSERT INTO blocks (title, dashed_name) VALUES ('basic-css', 'basic-css');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 75, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 76, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 77, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 78, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 79, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 80, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 81, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 82, 39);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 83, 42);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 84, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 85, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 86, 37);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 87, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 88, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 89, 40);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 90, 41);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 91, 25);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 92, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 93, 30);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 94, 28);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 95, 29);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 96, 26);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 97, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 98, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 99, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 100, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 101, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 102, 24);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 103, 23);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 104, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 105, 38);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 106, 43);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 107, 33);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 108, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 109, 22);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 110, 21);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 111, 20);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 112, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 113, 36);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 114, 31);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 115, 32);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 116, 35);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (3, 117, 34);

INSERT INTO blocks (title, dashed_name) VALUES ('basic-html-and-html5', 'basic-html-and-html5');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 118, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 119, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 120, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 121, 24);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 122, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 123, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 124, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 125, 22);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 126, 21);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 127, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 128, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 129, 26);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 130, 27);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 131, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 132, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 133, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 134, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 135, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 136, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 137, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 138, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 139, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 140, 25);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 141, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 142, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 143, 20);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (4, 144, 23);

INSERT INTO blocks (title, dashed_name) VALUES ('css-flexbox', 'css-flexbox');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (5, 145, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (5, 146, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (5, 147, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (5, 148, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (5, 149, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (5, 150, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (5, 151, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (5, 152, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (5, 153, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (5, 154, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (5, 155, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (5, 156, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (5, 157, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (5, 158, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (5, 159, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (5, 160, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (5, 161, 15);

INSERT INTO blocks (title, dashed_name) VALUES ('css-grid', 'css-grid');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 162, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 163, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 164, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 165, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 166, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 167, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 168, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 169, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 170, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 171, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 172, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 173, 21);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 174, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 175, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 176, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 177, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 178, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 179, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 180, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 181, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 182, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (6, 183, 20);

INSERT INTO blocks (title, dashed_name) VALUES ('responsive-web-design-principles', 'responsive-web-design-principles');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (7, 184, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (7, 185, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (7, 186, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (7, 187, 2);

INSERT INTO superblocks (title, dashed_name, superblock_order) VALUES ('javascript-algorithms-and-data-structures', 'javascript-algorithms-and-data-structures', 19);

INSERT INTO blocks (title, dashed_name) VALUES ('basic-algorithm-scripting', 'basic-algorithm-scripting');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (8, 188, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (8, 189, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (8, 190, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (8, 191, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (8, 192, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (8, 193, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (8, 194, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (8, 195, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (8, 196, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (8, 197, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (8, 198, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (8, 199, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (8, 200, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (8, 201, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (8, 202, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (8, 203, 13);

INSERT INTO blocks (title, dashed_name) VALUES ('basic-data-structures', 'basic-data-structures');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 204, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 205, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 206, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 207, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 208, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 209, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 210, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 211, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 212, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 213, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 214, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 215, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 216, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 217, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 218, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 219, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 220, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 221, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 222, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (9, 223, 15);

INSERT INTO blocks (title, dashed_name) VALUES ('basic-javascript', 'basic-javascript');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 224, 40);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 225, 42);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 226, 93);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 227, 92);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 228, 84);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 229, 83);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 230, 85);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 231, 87);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 232, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 233, 76);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 234, 30);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 235, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 236, 55);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 237, 82);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 238, 73);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 239, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 240, 59);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 241, 64);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 242, 65);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 243, 62);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 244, 66);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 245, 67);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 246, 60);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 247, 63);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 248, 68);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 249, 69);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 250, 20);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 251, 23);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 252, 22);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 253, 21);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 254, 27);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 255, 28);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 256, 29);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 257, 98);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 258, 81);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 259, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 260, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 261, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 262, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 263, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 264, 88);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 265, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 266, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 267, 26);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 268, 24);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 269, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 270, 31);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 271, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 272, 104);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 273, 105);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 274, 106);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 275, 51);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 276, 53);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 277, 74);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 278, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 279, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 280, 71);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 281, 70);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 282, 97);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 283, 99);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 284, 101);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 285, 96);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 286, 95);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 287, 52);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 288, 72);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 289, 44);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 290, 43);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 291, 45);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 292, 46);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 293, 91);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 294, 41);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 295, 77);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 296, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 297, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 298, 39);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 299, 100);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 300, 49);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 301, 61);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 302, 103);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 303, 25);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 304, 94);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 305, 102);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 306, 78);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 307, 50);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 308, 80);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 309, 79);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 310, 75);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 311, 47);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 312, 56);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 313, 38);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 314, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 315, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 316, 90);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 317, 33);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 318, 57);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 319, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 320, 54);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 321, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 322, 86);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 323, 32);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 324, 35);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 325, 34);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 326, 36);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 327, 58);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 328, 110);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 329, 111);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 330, 112);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 331, 109);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 332, 108);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 333, 107);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 334, 89);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 335, 37);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (10, 336, 48);

INSERT INTO blocks (title, dashed_name) VALUES ('debugging', 'debugging');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (11, 337, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (11, 338, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (11, 339, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (11, 340, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (11, 341, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (11, 342, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (11, 343, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (11, 344, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (11, 345, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (11, 346, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (11, 347, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (11, 348, 2);

INSERT INTO blocks (title, dashed_name) VALUES ('es6', 'es6');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 349, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 350, 26);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 351, 25);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 352, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 353, 23);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 354, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 355, 27);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 356, 28);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 357, 24);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 358, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 359, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 360, 21);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 361, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 362, 22);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 363, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 364, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 365, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 366, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 367, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 368, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 369, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 370, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 371, 20);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 372, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 373, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 374, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 375, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 376, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (12, 377, 15);

INSERT INTO blocks (title, dashed_name) VALUES ('functional-programming', 'functional-programming');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 378, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 379, 20);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 380, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 381, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 382, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 383, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 384, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 385, 23);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 386, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 387, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 388, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 389, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 390, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 391, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 392, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 393, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 394, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 395, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 396, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 397, 21);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 398, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 399, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 400, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (13, 401, 22);

INSERT INTO blocks (title, dashed_name) VALUES ('intermediate-algorithm-scripting', 'intermediate-algorithm-scripting');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 402, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 403, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 404, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 405, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 406, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 407, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 408, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 409, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 410, 20);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 411, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 412, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 413, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 414, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 415, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 416, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 417, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 418, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 419, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 420, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 421, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (14, 422, 3);

INSERT INTO blocks (title, dashed_name) VALUES ('javascript-algorithms-and-data-structures-projects', 'javascript-algorithms-and-data-structures-projects');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (15, 423, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (15, 424, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (15, 425, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (15, 426, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (15, 427, 3);

INSERT INTO blocks (title, dashed_name) VALUES ('object-oriented-programming', 'object-oriented-programming');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 428, 20);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 429, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 430, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 431, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 432, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 433, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 434, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 435, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 436, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 437, 21);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 438, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 439, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 440, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 441, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 442, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 443, 24);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 444, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 445, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 446, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 447, 22);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 448, 25);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 449, 23);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 450, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 451, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 452, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (16, 453, 7);

INSERT INTO blocks (title, dashed_name) VALUES ('regular-expressions', 'regular-expressions');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 454, 27);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 455, 29);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 456, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 457, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 458, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 459, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 460, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 461, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 462, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 463, 20);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 464, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 465, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 466, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 467, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 468, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 469, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 470, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 471, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 472, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 473, 23);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 474, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 475, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 476, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 477, 22);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 478, 28);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 479, 32);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 480, 21);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 481, 30);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 482, 26);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 483, 25);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 484, 24);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 485, 31);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (17, 486, 0);

INSERT INTO superblocks (title, dashed_name, superblock_order) VALUES ('front-end-development-libraries', 'front-end-development-libraries', 2);

INSERT INTO blocks (title, dashed_name) VALUES ('bootstrap', 'bootstrap');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 487, 23);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 488, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 489, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 490, 26);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 491, 24);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 492, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 493, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 494, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 495, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 496, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 497, 20);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 498, 25);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 499, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 500, 22);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 501, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 502, 28);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 503, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 504, 29);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 505, 27);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 506, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 507, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 508, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 509, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 510, 21);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 511, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 512, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 513, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 514, 30);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 515, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 516, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (18, 517, 7);

INSERT INTO blocks (title, dashed_name) VALUES ('front-end-development-libraries-projects', 'front-end-development-libraries-projects');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (19, 518, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (19, 519, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (19, 520, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (19, 521, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (19, 522, 0);

INSERT INTO blocks (title, dashed_name) VALUES ('jquery', 'jquery');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (20, 523, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (20, 524, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (20, 525, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (20, 526, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (20, 527, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (20, 528, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (20, 529, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (20, 530, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (20, 531, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (20, 532, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (20, 533, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (20, 534, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (20, 535, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (20, 536, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (20, 537, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (20, 538, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (20, 539, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (20, 540, 17);

INSERT INTO blocks (title, dashed_name) VALUES ('react', 'react');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 541, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 542, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 543, 33);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 544, 36);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 545, 24);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 546, 42);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 547, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 548, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 549, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 550, 28);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 551, 27);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 552, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 553, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 554, 20);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 555, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 556, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 557, 44);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 558, 35);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 559, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 560, 34);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 561, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 562, 30);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 563, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 564, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 565, 29);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 566, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 567, 41);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 568, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 569, 46);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 570, 22);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 571, 21);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 572, 38);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 573, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 574, 23);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 575, 39);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 576, 40);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 577, 37);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 578, 45);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 579, 43);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 580, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 581, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 582, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 583, 25);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 584, 32);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 585, 31);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 586, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (21, 587, 26);

INSERT INTO blocks (title, dashed_name) VALUES ('react-and-redux', 'react-and-redux');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (22, 588, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (22, 589, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (22, 590, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (22, 591, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (22, 592, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (22, 593, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (22, 594, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (22, 595, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (22, 596, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (22, 597, 3);

INSERT INTO blocks (title, dashed_name) VALUES ('redux', 'redux');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (23, 598, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (23, 599, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (23, 600, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (23, 601, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (23, 602, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (23, 603, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (23, 604, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (23, 605, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (23, 606, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (23, 607, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (23, 608, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (23, 609, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (23, 610, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (23, 611, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (23, 612, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (23, 613, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (23, 614, 12);

INSERT INTO blocks (title, dashed_name) VALUES ('sass', 'sass');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (24, 615, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (24, 616, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (24, 617, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (24, 618, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (24, 619, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (24, 620, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (24, 621, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (24, 622, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (24, 623, 3);

INSERT INTO superblocks (title, dashed_name, superblock_order) VALUES ('data-visualization', 'data-visualization', 3);

INSERT INTO blocks (title, dashed_name) VALUES ('d3-dashboard', 'd3-dashboard');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 624, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 625, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 626, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 627, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 628, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 629, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 630, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 631, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 632, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 633, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 634, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 635, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 636, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 637, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 638, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 639, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 640, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 641, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 642, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 643, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 644, 20);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 645, 21);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 646, 22);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 647, 23);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 648, 24);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 649, 25);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 650, 26);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 651, 27);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 652, 28);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 653, 29);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 654, 30);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 655, 31);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 656, 32);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 657, 33);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 658, 34);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 659, 35);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 660, 36);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 661, 37);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 662, 38);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 663, 39);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 664, 40);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 665, 41);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 666, 42);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 667, 43);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 668, 44);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 669, 45);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 670, 46);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 671, 47);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 672, 48);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 673, 49);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 674, 50);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 675, 51);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 676, 52);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 677, 53);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 678, 54);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 679, 55);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 680, 56);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 681, 57);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 682, 58);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 683, 59);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 684, 60);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 685, 61);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 686, 62);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 687, 63);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 688, 64);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 689, 65);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 690, 66);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 691, 67);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 692, 68);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 693, 69);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 694, 70);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 695, 71);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 696, 72);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 697, 73);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 698, 74);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 699, 75);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 700, 76);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 701, 77);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 702, 78);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 703, 79);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 704, 80);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 705, 81);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 706, 82);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 707, 83);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 708, 84);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 709, 85);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 710, 86);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 711, 87);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 712, 88);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 713, 89);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 714, 90);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 715, 91);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 716, 92);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 717, 93);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 718, 94);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 719, 95);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 720, 96);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 721, 97);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 722, 98);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 723, 99);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 724, 100);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 725, 101);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 726, 102);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 727, 103);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 728, 104);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 729, 105);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 730, 106);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 731, 107);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 732, 108);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 733, 109);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 734, 110);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 735, 111);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 736, 112);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 737, 113);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 738, 114);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 739, 115);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 740, 116);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 741, 117);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 742, 118);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 743, 119);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 744, 120);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 745, 121);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 746, 122);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 747, 123);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 748, 124);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 749, 125);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 750, 126);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 751, 127);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 752, 128);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 753, 129);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 754, 130);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 755, 131);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 756, 132);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 757, 133);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 758, 134);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 759, 135);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 760, 136);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 761, 137);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 762, 138);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 763, 139);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 764, 140);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 765, 141);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 766, 142);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 767, 143);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 768, 144);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (25, 769, 145);

INSERT INTO blocks (title, dashed_name) VALUES ('data-visualization-projects', 'data-visualization-projects');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (26, 770, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (26, 771, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (26, 772, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (26, 773, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (26, 774, 4);

INSERT INTO blocks (title, dashed_name) VALUES ('data-visualization-with-d3', 'data-visualization-with-d3');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 775, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 776, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 777, 21);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 778, 28);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 779, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 780, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 781, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 782, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 783, 22);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 784, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 785, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 786, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 787, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 788, 23);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 789, 20);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 790, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 791, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 792, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 793, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 794, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 795, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 796, 24);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 797, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 798, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 799, 27);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 800, 26);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 801, 25);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 802, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (27, 803, 3);

INSERT INTO blocks (title, dashed_name) VALUES ('json-apis-and-ajax', 'json-apis-and-ajax');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (28, 804, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (28, 805, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (28, 806, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (28, 807, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (28, 808, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (28, 809, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (28, 810, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (28, 811, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (28, 812, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (28, 813, 6);

INSERT INTO superblocks (title, dashed_name, superblock_order) VALUES ('back-end-development-and-apis', 'back-end-development-and-apis', 5);

INSERT INTO blocks (title, dashed_name) VALUES ('back-end-development-and-apis-projects', 'back-end-development-and-apis-projects');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (29, 814, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (29, 815, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (29, 816, 2);

INSERT INTO blocks (title, dashed_name) VALUES ('basic-node-and-express', 'basic-node-and-express');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (30, 817, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (30, 818, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (30, 819, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (30, 820, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (30, 821, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (30, 822, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (30, 823, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (30, 824, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (30, 825, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (30, 826, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (30, 827, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (30, 828, 5);

INSERT INTO blocks (title, dashed_name) VALUES ('managing-packages-with-npm', 'managing-packages-with-npm');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (31, 829, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (31, 830, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (31, 831, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (31, 832, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (31, 833, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (31, 834, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (31, 835, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (31, 836, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (31, 837, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (31, 838, 7);

INSERT INTO blocks (title, dashed_name) VALUES ('mongodb-and-mongoose', 'mongodb-and-mongoose');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (32, 839, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (32, 840, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (32, 841, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (32, 842, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (32, 843, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (32, 844, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (32, 845, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (32, 846, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (32, 847, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (32, 848, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (32, 849, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (32, 850, 5);

INSERT INTO superblocks (title, dashed_name, superblock_order) VALUES ('quality-assurance', 'quality-assurance', 6);

INSERT INTO blocks (title, dashed_name) VALUES ('advanced-node-and-express', 'advanced-node-and-express');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 851, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 852, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 853, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 854, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 855, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 856, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 857, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 858, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 859, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 860, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 861, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 862, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 863, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 864, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 865, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 866, 21);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 867, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 868, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 869, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 870, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (33, 871, 1);

INSERT INTO blocks (title, dashed_name) VALUES ('quality-assurance-and-testing-with-chai', 'quality-assurance-and-testing-with-chai');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 872, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 873, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 874, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 875, 20);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 876, 21);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 877, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 878, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 879, 24);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 880, 23);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 881, 22);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 882, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 883, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 884, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 885, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 886, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 887, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 888, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 889, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 890, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 891, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 892, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 893, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 894, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 895, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (34, 896, 5);

INSERT INTO blocks (title, dashed_name) VALUES ('quality-assurance-projects', 'quality-assurance-projects');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (35, 897, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (35, 898, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (35, 899, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (35, 900, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (35, 901, 3);

INSERT INTO superblocks (title, dashed_name, superblock_order) VALUES ('scientific-computing-with-python', 'scientific-computing-with-python', 7);

INSERT INTO blocks (title, dashed_name) VALUES ('learn-algorithm-design-by-building-a-shortest-path-algorithm', 'learn-algorithm-design-by-building-a-shortest-path-algorithm');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 902, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 903, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 904, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 905, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 906, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 907, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 908, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 909, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 910, 20);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 911, 21);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 912, 22);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 913, 23);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 914, 24);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 915, 25);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 916, 26);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 917, 27);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 918, 28);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 919, 29);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 920, 30);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 921, 31);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 922, 32);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 923, 33);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 924, 34);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 925, 35);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 926, 36);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 927, 37);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 928, 39);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 929, 40);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 930, 41);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 931, 42);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 932, 43);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 933, 44);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 934, 46);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 935, 47);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 936, 49);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 937, 48);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 938, 50);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 939, 51);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 940, 53);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 941, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 942, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 943, 45);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 944, 52);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 945, 38);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 946, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 947, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 948, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 949, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 950, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 951, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 952, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 953, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 954, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (36, 955, 10);

INSERT INTO blocks (title, dashed_name) VALUES ('learn-classes-and-objects-by-building-a-sudoku-solver', 'learn-classes-and-objects-by-building-a-sudoku-solver');

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 956, 0);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 957, 1);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 958, 2);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 959, 3);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 960, 4);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 961, 5);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 962, 6);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 963, 7);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 964, 8);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 965, 9);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 966, 10);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 967, 11);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 968, 12);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 969, 13);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 970, 14);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 971, 15);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 972, 16);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 973, 17);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 974, 18);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 975, 19);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 976, 20);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 977, 21);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 978, 22);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 979, 23);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 980, 24);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 981, 25);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 982, 26);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 983, 27);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 984, 28);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 985, 29);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 986, 30);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 987, 31);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 988, 32);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 989, 33);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 990, 34);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 991, 35);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 992, 36);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 993, 37);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 994, 38);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 995, 39);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 996, 40);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 997, 41);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 998, 42);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 999, 43);

INSERT INTO blocks_challenges (block_id, challenge_id, challenge_order) VALUES (37, 1000, 44);
