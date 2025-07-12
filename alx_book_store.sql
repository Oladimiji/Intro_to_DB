# File: MySQLserver.py
# Python script to execute task_2.sql and set up alx_book_store database

import mysql.connector
from mysql.connector import Error

def execute_sql_script():
    try:
        # Connect to MySQL server (update with your credentials)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",  # Replace with your MySQL username
            password="Temitayo123#"  # Replace with your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()

            # Create database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            cursor.execute("USE alx_book_store")

            # Read and execute the task_2.sql script
            with open("task_2.sql", "r") as file:
                sql_script = file.read()

            # Split the script into individual statements and execute them
            for statement in sql_script.split(";"):
                # Skip empty statements
                if statement.strip():
                    cursor.execute(statement)

            # Commit changes
            connection.commit()
            print("Database and tables created successfully from task_2.sql")

    except Error as e:
        print(f"Error: {e}")

    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection closed")

if _name_ == "_main_":
    execute_sql_script()