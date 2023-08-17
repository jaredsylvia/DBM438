import argparse
from prometheus_client import CollectorRegistry, Gauge, generate_latest
import mysql.connector

# Connect to MySQL server
mysql_host = "your_mysql_host"
mysql_user = "your_mysql_user"
mysql_password = "your_mysql_password"
conn = mysql.connector.connect(host=mysql_host, user=mysql_user, password=mysql_password)

# Prometheus metrics
registry = CollectorRegistry()
db_count = Gauge("mysql_database_count", "Number of databases", registry=registry)
table_count = Gauge("mysql_table_count", "Number of tables in each database", ["database"], registry=registry)
entry_count = Gauge("mysql_entry_count", "Number of entries in each table", ["database", "table"], registry=registry)

def main(output_file):
    if conn.is_connected():
        cursor = conn.cursor()

        # Get list of databases
        cursor.execute("SHOW DATABASES")
        databases = [db[0] for db in cursor.fetchall()]

        # Iterate over databases and tables
        for database in databases:
            if database != 'sys':
                cursor.execute(f"USE {database}")
                cursor.execute("SHOW TABLES")
                tables = [table[0] for table in cursor.fetchall()]

                db_count.set(1)
                table_count.labels(database=database).set(len(tables))

                for table in tables:
                    entry_count.labels(database=database, table=table).set(count_entries(cursor, database, table))

        cursor.close()
        conn.close()

        # Write metrics to the specified file
        with open(output_file, "w") as f:
            f.write(generate_latest(registry).decode("utf-8"))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate Prometheus metrics for MySQL databases.")
    parser.add_argument("--output", type=str, required=True, help="File location to save the metrics")
    args = parser.parse_args()

    main(args.output)
