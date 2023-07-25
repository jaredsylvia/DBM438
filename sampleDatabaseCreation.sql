-- Create the database if not exists
CREATE DATABASE IF NOT EXISTS blog_db;
USE blog_db;

-- Create the 'users' table
CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    FULLTEXT INDEX idx_username_email (username, email)
);

-- Create the 'categories' table
CREATE TABLE IF NOT EXISTS categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

-- Create the 'posts' table
CREATE TABLE IF NOT EXISTS posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    FULLTEXT INDEX idx_title_content (title, content),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Prepopulate the 'users' table
INSERT INTO users (username, email, password) VALUES
('john_doe', 'john.doe@example.com', 'hashed_password_1'),
('jane_smith', 'jane_smith@example.com', 'hashed_password_2'),
('alex_wilson', 'alex.wilson@gmail.com', 'hashed_password_3'),
('emma_johnson', 'emma.johnson@yahoo.com', 'hashed_password_4'),
('michael_brown', 'michael.brown@hotmail.com', 'hashed_password_5'),
('sophia_taylor', 'sophia.taylor@example.net', 'hashed_password_6'),
('william_clark', 'william_clark@gmail.com', 'hashed_password_7'),
('olivia_harris', 'olivia_harris@hotmail.com', 'hashed_password_8'),
('james_martin', 'james_martin@yahoo.com', 'hashed_password_9'),
('emily_thomas', 'emily.thomas@example.org', 'hashed_password_10'),
-- Additional users with first name "John"
('john_doe_2', 'john.doe2@example.com', 'hashed_password_11'),
('john_smith', 'john.smith@example.com', 'hashed_password_12'),
('john_wilson', 'john.wilson@example.com', 'hashed_password_13'),
('john_johnson', 'john.johnson@example.com', 'hashed_password_14'),
-- Additional users with last name "Doe"
('jane_doe', 'jane.doe@example.com', 'hashed_password_15'),
('alex_doe', 'alex.doe@example.com', 'hashed_password_16'),
('michael_doe', 'michael.doe@example.com', 'hashed_password_17'),
('sophia_doe', 'sophia.doe@example.com', 'hashed_password_18');

-- Prepopulate the 'categories' table
INSERT INTO categories (name) VALUES
('Technology'),
('Travel'),
('Food'),
('Fashion'),
('Health'),
('Sports'),
('Art'),
('Music'),
('Politics'),
('Science'),
('Business'),
('Education');

-- Prepopulate the 'posts' table
INSERT INTO posts (title, content, user_id, category_id) VALUES
('Introduction to MySQL', 'MySQL is a popular relational database management system.', 1, 1),
('Tips for Traveling on a Budget', 'Traveling can be affordable with proper planning and budgeting.', 2, 2),
('Delicious and Easy-to-Make Recipes', 'Check out these tasty recipes you can prepare in no time.', 1, 3),
('Securing Your MySQL Database', 'Learn about best practices to secure your MySQL database.', 1, 1),
('Exploring Exotic Destinations', 'Discover some of the most exotic places to visit around the world.', 2, 2),
('The Latest Fashion Trends', 'Stay updated with the latest fashion trends and styles.', 4, 4),
('Staying Fit with Home Workouts', 'Tips for staying fit and healthy with home workout routines.', 5, 5),
('Mastering the Guitar', 'Learn essential guitar techniques and tricks to become a pro.', 6, 7),
('Understanding Global Politics', 'Insights into the complex world of international politics.', 8, 9),
('The Wonders of the Cosmos', 'Exploring the fascinating mysteries of the universe and beyond.', 10, 10),
('Starting Your Own Business', 'Key steps and advice for aspiring entrepreneurs.', 9, 11),
('The Importance of Lifelong Learning', 'Continuous learning is essential for personal and professional growth.', 10, 12),
('Healthy and Delicious Smoothie Recipes', 'Enjoy these refreshing and nutritious smoothie recipes.', 3, 3),
('The Beauty of Relational Databases', 'Understanding the power and elegance of relational databases.', 7, 1),
('Fashion Trends to Follow This Season', 'A guide to the latest fashion trends and how to incorporate them into your wardrobe.', 4, 4),
('Budget Traveling Tips and Tricks', 'Explore the world on a budget with these useful travel tips.', 2, 2),
('The Art of Playing Guitar', 'Discover the artistry behind playing the guitar and express your musical talent.', 6, 7),
('Database Design Principles', 'Essential principles for designing effective and scalable databases.', 7, 1),
('Delicious Recipes for Every Occasion', 'Explore a variety of delicious recipes to satisfy your culinary cravings.', 3, 3),
('Budget-Friendly Fashion Hacks', 'Stay fashionable without breaking the bank with these budget-friendly fashion hacks.', 4, 4),
('Traveling to Exotic Destinations', 'Embark on a journey to the most exotic and breathtaking travel destinations.', 2, 2),
('Health and Fitness at Home', 'Achieve your fitness goals with effective home workout routines and healthy living tips.', 5, 5),
('The World of Piano Music', 'Immerse yourself in the captivating world of piano music and its rich history.', 7, 8),
('The Future of Technology', 'Exploring the latest advancements in technology and their impact on society.', 1, 1),
('The Impact of Politics on Global Economy', 'Understanding the intersection of politics and economics in today\'s global landscape.', 8, 9),
('Science Behind the Natural Wonders', 'Unraveling the scientific mysteries behind the wonders of nature.', 10, 10),
('Entrepreneurship and Success', 'Inspirational stories of successful entrepreneurs and their journey to success.', 9, 11),
('Continuous Learning for Personal Growth', 'Embracing a lifelong learning mindset to foster personal growth and development.', 10, 12),
('Delightful Smoothie Recipes for a Healthy Lifestyle', 'Indulge in these delightful smoothie recipes packed with nutrition and flavor.', 3, 3);
