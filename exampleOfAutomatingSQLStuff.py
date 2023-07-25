import mysql.connector

# MySQL connection details
host = 'localhost'
user = 'your_username'
password = 'your_password'

# Connect to MySQL server
try:
    conn = mysql.connector.connect(
        host=host,
        user=user,
        password=password
    )
    cursor = conn.cursor()
    print('Connected to MySQL server')

    # Retrieve list of databases
    cursor.execute('SHOW DATABASES')
    databases = [database[0] for database in cursor.fetchall()]

    # Iterate over databases
    for database in databases:
        print(f'Using database: {database}')
        cursor.execute(f'USE {database}')

        # Retrieve list of tables in the current database
        cursor.execute('SHOW TABLES')
        tables = [table[0] for table in cursor.fetchall()]

        # Iterate over tables
        for table in tables:
            print(f'Describing table: {table}')
            cursor.execute(f'DESCRIBE {table}')
            table_description = cursor.fetchall()

            # Display table description
            for column in table_description:
                print(column)

        print('---')

except mysql.connector.Error as err:
    print(f'Error connecting to MySQL: {err}')

finally:
    # Close the cursor and connection
    if cursor:
        cursor.close()
    if conn:
        conn.close()
        print('MySQL connection closed')
