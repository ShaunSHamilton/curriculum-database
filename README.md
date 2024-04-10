# Curriculum Database

## Notes

Make a query with a file

```bash
mysql --host 127.0.0.1 --port 3306 -u root -p curriculum < queries/<name>.sql
```

MYSQL has reserved words: https://dev.mysql.com/doc/refman/8.0/en/keywords.html

- `description` has been renamed to `descriptions`
- `time` has been renamed to `time_to_complete`
- `url` has been renamed to `course_url`
- `required` has been renamed to `required_resources`
