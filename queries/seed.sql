INSERT INTO superblocks(dashed_name) VALUES("rwd"),("english");
INSERT INTO blocks(dashed_name) VALUES("learn-html"), ("learn-css"), ("learn-greetings");
INSERT INTO superblocks_blocks(superblock_id,block_id) VALUES(1,1),(1,2),(2,3);

INSERT INTO challenges(dashed_name) VALUES("step-1"),("step-2"),("step-1"),("step-2"),("task-1");
INSERT INTO blocks_challenges(block_id,challenge_id) VALUES(1,1),(1,2),(2,3),(2,4),(3,5);

INSERT INTO descriptions(id,description) VALUES(1,"Description 1"),(2,"Description 2"),(3,"Description 3"),(4,"Description 4"),(5,"Description 5");
INSERT INTO challenge_files(id,challenge_files) VALUES(1,'[{"contents": "const a = 1;"}]');
INSERT INTO instructions(id,instruction) VALUES(1,"Instruction 1");
INSERT INTO sentences(id,sentence) VALUES(5,"__, Tom!");