-- Active: 1731606790060@@127.0.0.1@3306@notes
USE Notes;

CREATE TABLE IF NOT EXISTS Categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS SubCategories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

CREATE TABLE IF NOT EXISTS SubsubCategories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    subcategory_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories(id),
    FOREIGN KEY (subcategory_id) REFERENCES SubCategories(id)
);

CREATE TABLE IF NOT EXISTS Notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    content TEXT,
    images JSON,
    files JSON,
    subsubcategory_id INT NOT NULL,
    subcategory_id INT NOT NULL,
    category_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (subsubcategory_id) REFERENCES SubsubCategories(id),
    FOREIGN KEY (subcategory_id) REFERENCES SubCategories(id),
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

ALTER TABLE Notes
ADD COLUMN contain_image BOOLEAN NOT NULL DEFAULT FALSE,
ADD COLUMN contain_file BOOLEAN NOT NULL DEFAULT FALSE,
ADD COLUMN contain_text BOOLEAN NOT NULL DEFAULT FALSE,
ADD COLUMN last_modify_date DATE;

ALTER TABLE Notes
MODIFY COLUMN last_modify_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE Users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);