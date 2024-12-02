import pandas as pd
import pyodbc 

# Establish connection to SQL Server
conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=YourServerName;'
                      'Database=YourDatabaseName;'
                      'Trusted_Connection=yes;')

# Query data from SQL Server
query1 = "SELECT ID, Column1, Column2, Column3 FROM Uvalde78801"
query2 = "SELECT Column1, Column2, Column3, ColumnToUpdate1, ColumnToUpdate2 FROM Googleraw"

df_uvalde = pd.read_sql(query1, conn)
df_google = pd.read_sql(query2, conn)

# Clean columns
def clean_column(column):
    return column.str.replace('[^\w\s]','').str.replace(' ', '')

df_uvalde['Cleaned_Column1'] = clean_column(df_uvalde['Column1'])
df_uvalde['Cleaned_Column2'] = clean_column(df_uvalde['Column2'])
df_uvalde['Cleaned_Column3'] = clean_column(df_uvalde['Column3'])
df_google['Cleaned_Column1'] = clean_column(df_google['Column1'])
df_google['Cleaned_Column2'] = clean_column(df_google['Column2'])
df_google['Cleaned_Column3'] = clean_column(df_google['Column3'])

# Merge and update
merged_df = pd.merge(df_uvalde, df_google, on=['Cleaned_Column1', 'Cleaned_Column2', 'Cleaned_Column3'], how='inner')

# Update Uvalde78801
for index, row in merged_df.iterrows():
    uvalde_id = row['ID']
    update_val1 = row['ColumnToUpdate1']
    update_val2 = row['ColumnToUpdate2']
    conn.execute(f"UPDATE Uvalde78801 SET ColumnToUpdate1 = '{update_val1}', ColumnToUpdate2 = '{update_val2}' WHERE ID = '{uvalde_id}'")
    conn.commit()

print("Update successful!")

# Close connection
conn.close()
