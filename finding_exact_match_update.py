import pandas as pd
import pyodbc 

# Replace with your SQL Server connection details
server_1 = '72.190.10.169'
database_1 = 'LeadGrid'
username_1 = 'Habib'
password_1 = '1.Password.1'
# port = '3306'
connection_string = f'DRIVER={{SQL Server}};SERVER={server_1};DATABASE={database_1};UID={username_1};PWD={password_1}'
# MySQL ODBC 8.3 ANSI Driver
# MySQL ODBC 8.3 Unicode Driver


# Establish connection to SQL Server
conn = pyodbc.connect(connection_string)


# Query data from SQL Server
query1 = "SELECT name as name, address, zipcode as zip ,phone, website FROM Googleraw"
query2 = "SELECT name as name, address, zip ,phone, website FROM Uvalde78801"



df_uvalde = pd.read_sql(query2, conn)
df_google = pd.read_sql(query1, conn)

# print(df_google['name'])
# print(df_uvalde['name'])
# # Clean columns
# def clean_column(column):
#     return column.str.replace('[^a-zA-Z0-9\s]', '').str.replace(' ', '')

# # Clean columns
# def clean_column(column):
#     return column.str.replace('[^\w\s]','').str.replace(' ', '')

def clean_column(column):
    return_value = column.str.replace('[,:\#\-\;\.\~\'\&\(\)\/\\\]','')
    clean_space = return_value.str.replace(' ', '')  # Remove spaces
    return clean_space


df_uvalde['Cleaned_name'] = clean_column(df_uvalde['name'])
df_uvalde['Cleaned_address'] = clean_column(df_uvalde['address'])
df_uvalde['Cleaned_zip'] = clean_column(df_uvalde['zip'])
df_google['Cleaned_name'] = clean_column(df_google['name'])
df_google['Cleaned_address'] = clean_column(df_google['address'])
df_google['Cleaned_zip'] = clean_column(df_google['zip'])

# print(df_google['name'] + 'cleaned')
# print(df_uvalde['name']+ 'cleaned')

# Merge and update
merged_df = pd.merge(df_uvalde, df_google , on=['Cleaned_name','Cleaned_address'] , how='join')   # how='inner', 
# merged_df = df_uvalde.merge(df_google,left_on='name', right_on='name',how='inner')
# print(merged_df)

merged_df.to_excel('finding_exact_matched_update.xlsx', index=True)
# # Update Uvalde78801
# for index, row in merged_df.iterrows():
#     uvalde_id = row['ID']
#     update_val1 = row['ColumnToUpdate1']
#     update_val2 = row['ColumnToUpdate2']
#     conn.execute(f"UPDATE Uvalde78801 SET ColumnToUpdate1 = '{update_val1}', ColumnToUpdate2 = '{update_val2}' WHERE ID = '{uvalde_id}'")
#     conn.commit()

# print("Update successful!")

# Close connection
conn.close()
