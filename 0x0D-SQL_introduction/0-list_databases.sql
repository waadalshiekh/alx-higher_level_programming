--lists all databases of MySQL server.
import mysql.connector

# Establish a connection to the MySQL server
try:
    connection = mysql.connector.connect(
        host="your_mysql_host",
        user="your_mysql_user",
        password="your_mysql_password"
    )

    if connection.is_connected():
        # Create a cursor object to execute queries
        cursor = connection.cursor()

        # Execute the query to list databases
        cursor.execute("SHOW DATABASES")

        # Fetch all the databases
        databases = cursor.fetchall()

        # Print the list of databases
        print("List of databases:")
        for database in databases:
            print(database[0])

except mysql.connector.Error as e:
    print("Error while connecting to MySQL", e)

finally:
    # Close cursor and connection
    if 'connection' in locals():
        cursor.close()
        connection.close()
