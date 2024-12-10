# MySQL Database Project

## Project Overview

This is a MySQL database project that includes the creation of the database, table definitions, and some example data insertions.

## File Structure

- `MyDataBase.sql`: SQL script to create the database.
- `MyTable.sql`: SQL script to create tables.
- `MyQueries.sql`: SQL script to insert example data.
- `.gitignore`: Git ignore file configuration.

## Tables

- `Categories`: Stores category information.
- `SubCategories`: Stores subcategory information.
- `SubsubCategories`: Stores subsubcategory information.
- `Notes`: Stores notes with associated images and files.

## Usage

1. Ensure MySQL server is installed.
2. Open Command Prompt or Terminal and log in to the MySQL server:
    ```sh
    mysql -u root -p
    ```
3. Execute the `MyDataBase.sql` file to create the database:
    ```sql
    SOURCE path/to/MyDataBase.sql;
    ```
4. Execute the `MyTable.sql` file to create tables:
    ```sql
    SOURCE path/to/MyTable.sql;
    ```
5. Execute the `MyQueries.sql` file to insert example data:
    ```sql
    SOURCE path/to/MyQueries.sql;
    ```

## Contribution

Feel free to submit issues and contribute to the code. Please make sure to create a branch and test thoroughly before submitting.

## License

This project is licensed under the MIT License.
