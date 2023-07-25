-- Use the blog_db database
USE blog_db;

-- Advanced Full-Text Search using Natural Language Mode:

-- Natural Language Search for posts containing "traveling" (IN NATURAL LANGUAGE MODE)
SELECT * FROM posts
WHERE MATCH(title, content) AGAINST('traveling' IN NATURAL LANGUAGE MODE);

-- Natural Language Search for posts containing "technology" or "database" (IN NATURAL LANGUAGE MODE)
SELECT * FROM posts
WHERE MATCH(title, content) AGAINST('technology database' IN NATURAL LANGUAGE MODE);

-- Natural Language Search for posts containing the phrase "latest fashion trends" (IN NATURAL LANGUAGE MODE)
SELECT * FROM posts
WHERE MATCH(title, content) AGAINST('"latest fashion trends"' IN NATURAL LANGUAGE MODE);

-- Natural Language Search for users with usernames or emails containing "john" (IN NATURAL LANGUAGE MODE)
SELECT * FROM users
WHERE MATCH(username, email) AGAINST('john' IN NATURAL LANGUAGE MODE);

-- Advanced Full-Text Search using Boolean Mode:

-- Boolean Mode Search for posts containing "traveling" and "budget" (IN BOOLEAN MODE)
SELECT * FROM posts
WHERE MATCH(title, content) AGAINST('+traveling +budget' IN BOOLEAN MODE);

-- Boolean Mode Search for posts containing "technology" but not "MySQL" (IN BOOLEAN MODE)
SELECT * FROM posts
WHERE MATCH(title, content) AGAINST('technology -MySQL' IN BOOLEAN MODE);

-- Boolean Mode Search for posts containing either "guitar" or "music" (IN BOOLEAN MODE)
SELECT * FROM posts
WHERE MATCH(title, content) AGAINST('guitar OR music' IN BOOLEAN MODE);

-- Boolean Mode Search for posts containing the phrase "healthy recipes" (IN BOOLEAN MODE)
SELECT * FROM posts
WHERE MATCH(title, content) AGAINST('+"healthy recipes"' IN BOOLEAN MODE);

-- Boolean Mode Search for users with usernames containing "john" but not "doe" (IN BOOLEAN MODE)
SELECT * FROM users
WHERE MATCH(username, email) AGAINST('+john -doe' IN BOOLEAN MODE);

-- Additional Queries to Compare Results in Boolean and Natural Language Modes:

-- Search for posts containing "technology MySQL" in natural language mode
SELECT * FROM posts
WHERE MATCH(title, content) AGAINST('technology MySQL' IN NATURAL LANGUAGE MODE);

-- Search for posts containing "technology MySQL" in boolean mode
SELECT * FROM posts
WHERE MATCH(title, content) AGAINST('+"technology MySQL"' IN BOOLEAN MODE);

-- Search for users with usernames containing "john doe" in natural language mode
SELECT * FROM users
WHERE MATCH(username, email) AGAINST('john doe' IN NATURAL LANGUAGE MODE);

-- Search for users with usernames containing "john doe" in boolean mode
SELECT * FROM users
WHERE MATCH(username, email) AGAINST('+"john doe"' IN BOOLEAN MODE);
