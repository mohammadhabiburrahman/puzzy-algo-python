import pyodbc
import pandas as pd
from fuzzywuzzy import fuzz, process

# Replace with your SQL Server connection details
server_1 = '72.190.10.169'
database_1 = 'LeadGrid'
username_1 = 'Habib'
password_1 = '1.Password.1'
# port = '3306'
connection_string_1 = f'DRIVER={{SQL Server}};SERVER={server_1};DATABASE={database_1};UID={username_1};PWD={password_1}'
# MySQL ODBC 8.3 ANSI Driver
# MySQL ODBC 8.3 Unicode Driver


# Connect to the databases
conn_1 = pyodbc.connect(connection_string_1)

# Define your queries to fetch the data from the databases
query_1 = 'SELECT * FROM UVALDE78801 where id not in (select u.id from Googleraw t join uvalde78801 u on u.id = t.companyid)'
query_2 = 'SELECT * FROM googleraw'

# Fetch data into pandas DataFrames
df_1 = pd.read_sql_query(query_1, conn_1)
df_2 = pd.read_sql_query(query_2, conn_1)

# Close the connections
conn_1.close()

# #working function instead of lambda
# def find_best_match(name):
#     best_match, _ = process.extractOne(name, df_2["name"][0])
#     return best_match


# successful try
df_1["best_matched"] = df_1["Name"].map(lambda x: process.extractOne(x, df_2["name"])[0])
df_1["best_matched_address"] = df_1["Address"].map(lambda x: process.extractOne(x, df_2["address"])[0])
df_1["best_matched_zip"] = df_1["Zip"].map(lambda x: process.extractOne(x, df_2["zipcode"])[0])
# print(df_1)


closest_matched_df = df_1 

# Merge df_1 and df_2 based on the 'ID' column
# merged_df = pd.merge(closest_matched_df, df_2, on='ID', how='left')

merged_df = closest_matched_df.merge(df_2,left_on='best_matched', right_on='name',how='left')
merged_df.to_excel('best_matched_phone_website_chicking.xlsx', index=True)

conn= pyodbc.connect(connection_string_1)

try:
    for index,row in merged_df.iterrows():
        value_to_match = row['Name']
        new_value = row['phone']
        new_value_2 = row['website']
        # new_value_3 = row['ID']


        # Construct and execute the SQL UPDATE query
        sql_query = f"""
                    UPDATE UVALDE78801
                    SET Phone = '{new_value}',
                    Website = '{new_value_2}'
                    WHERE Name = '{value_to_match}'
                    """
#          AND ID = '{new_value_3}'        
    cursor = conn.cursor()
    cursor.execute(sql_query)
    conn.commit()
    # Close the connection
    conn.close()
except:
    print("Not Updated")

# merged_df.to_excel('best_matched_phone_website_chicking.xlsx', index=True)

