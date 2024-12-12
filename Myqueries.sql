USE Notes;

INSERT INTO Categories (name) VALUES ('Test Category');

INSERT INTO SubCategories (name, category_id) VALUES ('Test SubCategory', 1);

INSERT INTO SubsubCategories (name, subcategory_id) VALUES ('Test SubSubCategory', 1);

INSERT INTO users (username, password) VALUES ('JinhuaHe', '$2b$10$LjHlSu6/uHyaqGtL/E3L3e81Udin9c2W1OSaM67iIEdvylC4YrhCG');