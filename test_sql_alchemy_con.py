from sqlalchemy import create_engine


server= '72.190.10.169'
database = 'LeadGrid'
username = 'Habib'
password = '1.Password.1'

# Create the database URL
# For SQL Server, the URL format is: dialect+driver://username:password@host:port/database
# For example, using the 'pyodbc' driver
connection_string = f'mssql+pyodbc://{username}:{password}@{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server'

# Create the engine
engine = create_engine(connection_string)

# Establish a connection
connection = engine.connect()

# Example: execute a SQL query
query = "SELECT name,address,zipcode as zip FROM Googleraw where name = 'Walmart Supercenter'"
result = connection.execute(query)

# Fetch and print the results
for row in result:
    print(row)

# Close the connection
engine.dispose()
