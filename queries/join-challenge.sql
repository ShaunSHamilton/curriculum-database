SELECT
  c.dashed_name,
  d.description,
  f.challenge_files,
  i.instruction,
  s.sentence
FROM
  challenges c
LEFT JOIN descriptions d ON c.id = d.id
LEFT JOIN challenge_files f ON c.id = f.id
LEFT JOIN instructions i ON c.id = i.id
LEFT JOIN sentences s ON c.id = s.id
WHERE
  c.id = 1;