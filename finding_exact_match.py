import pyodbc
import pandas as pd
import re



# Replace with your SQL Server connection details
server_1 = '72.190.10.169'
database_1 = 'LeadGrid'
username_1 = 'Habib'
password_1 = '1.Password.1'
# port = '3306'
connection_string_1 = f'DRIVER={{SQL Server}};SERVER={server_1};DATABASE={database_1};UID={username_1};PWD={password_1}'
# MySQL ODBC 8.3 ANSI Driver
# MySQL ODBC 8.3 Unicode Driver


# Establish connection to SQL Server
conn_1 = pyodbc.connect(connection_string_1)

# Create cursor
cursor = conn_1.cursor()

# Example tables
table_a = 'UVALDE78801'
table_b = 'Googleraw'

# Fetch data from table_a
cursor.execute(f'SELECT name, address, zip FROM {table_a}')
data_a = cursor.fetchall()

# Fetch data from table_b
cursor.execute(f'SELECT name, address, zipcode FROM {table_b}')
data_b = cursor.fetchall()

# SQL query to fetch data from table_a
query_a = "SELECT [name],[address],[zip] as zip FROM [LeadGrid].[dbo].[UVALDE78801] where [Name] = 'ANGEL BREEZE SERVICES'"

# SQL query to fetch data from table_b
query_b = "SELECT [name],[address],[zipcode] as zip FROM [LeadGrid].[dbo].[Googleraw] where [Name] = 'ANGEL BREEZE SERVICES'"


# Read data from SQL Server into pandas dataframes
df_a = pd.read_sql(query_a, conn_1)
df_b = pd.read_sql(query_b, conn_1)


# Close cursor and connection
cursor.close()
conn_1.close()


# Apply TRIM() function to remove leading and trailing spaces
for col in ['name', 'address', 'zip']:
    df_a[col] = df_a[col].str.strip()
    df_b[col] = df_b[col].str.strip()


# Remove special characters using regex
special_chars = r'[^\w\s]'  # Remove anything that is not a word character or whitespace
for col in ['name', 'address', 'zip']:
    df_a[col] = df_a[col].apply(lambda x: re.sub(special_chars, '', x))
    df_b[col] = df_b[col].apply(lambda x: re.sub(special_chars, '', x))


# Compare columns from table_a with columns from table_b
comparison_result = (df_a == df_b).all().all()


# Compare columns from table_a with columns from table_b
matching_output = pd.merge(df_a, df_b, on=['name', 'address', 'zip'], how='inner')


# Add a marker column to indicate the source table
df_a['Source'] = 'Table A'
df_b['Source'] = 'Table B'

# Concatenate both tables along with the matching output
concatenated_output = pd.concat([df_a, df_b, matching_output])


# Save concatenated output to Excel file
concatenated_output.to_excel('concatenated_output.xlsx', index=False)
# Optionally, you can print the first few rows of each DataFrame to visually inspect the data
print("First few rows of table_a:")
print(df_a.head())

print("First few rows of table_b:")
print(df_b.head())

# Find exact matches based on three columns
# exact_matches = pd.merge(df_a, df_b, on=['name'], how='inner')
print(df_a['name'])
print(df_b['name'])
exact_matches = df_a


# Export matched data to Excel file
exact_matches.to_excel('exact_matches.xlsx', index=False)
print("Exact matches data has been exported to 'exact_matches.xlsx' file.")


# # Find exact matches based on three columns
# exact_matches = []
# for row_a in data_a:
#     for row_b in data_b:
#         if row_a == row_b:
#             exact_matches.append(row_a)

# # Print exact matches
# for match in exact_matches:
#     print("Exact match:", match)
