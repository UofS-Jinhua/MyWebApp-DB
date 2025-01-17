-- Active: 1733976230969@@9527notedb.mysql.database.azure.com@3306@notes
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

CREATE TABLE IF NOT EXISTS LinkedNotes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    note_id INT NOT NULL,
    linked_note_id JSON NOT NULL,
    FOREIGN KEY (note_id) REFERENCES Notes(id)
);



-- Let the database support utf8mb4 (can use Chinese characters)
ALTER TABLE Categories CHANGE name name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE SubCategories CHANGE name name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE SubsubCategories CHANGE name name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE Notes CHANGE title title VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE Notes CHANGE content content TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
