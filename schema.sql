CREATE DATABASE IF NOT EXISTS food_tech_analytics;
USE food_tech_analytics;

CREATE TABLE locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50) DEFAULT 'Bangalore'
);

CREATE TABLE restaurants (
    res_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location_id INT,
    avg_cost_for_two DECIMAL(10, 2),
    has_online_order BOOLEAN,
    has_book_table BOOLEAN,
    FOREIGN KEY (location_id) REFERENCES locations(location_id) ON DELETE SET NULL
);

CREATE TABLE ratings_fact (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    res_id INT,
    rating_value DECIMAL(3, 2),
    votes INT,
    FOREIGN KEY (res_id) REFERENCES restaurants(res_id) ON DELETE CASCADE
);

CREATE INDEX idx_location ON restaurants(location_id);