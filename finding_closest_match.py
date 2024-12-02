import pandas as pd
from fuzzywuzzy import process
from fuzzywuzzy import fuzz

# Sample DataFrames
df1 = pd.DataFrame({
    'Company1': ["Apple Inc.", "Microsoft Corporation", "Google LLC", "Amazon.com Inc.", "Facebook, Inc."]
})

df2 = pd.DataFrame({
    'Company2': ["Apples Inc.", "MSFT Corp", "Google", "Amazon", "Facebook"]
})


df3 = ["Apple Inc.", "Microsoft Corporation", "Google LLC", "Amazon.com Inc.", "Facebook, Inc."]
df4 = ["Apples Inc.", "MSFT Corp", "Google", "Amazon", "Facebook"]

df_3 = pd.DataFrame(df3,columns=["Company_name"])
df_4 = pd.DataFrame(reversed(df4),columns=["Company_name"])

# print(df1)
# print(df2)
# print("NExt data frame set")
# print(df_3)
# print(df_4)


# print(process.extractOne("Microsoft Corpor",df_3["Company_name"]))

df_3["best_matched"] = df_3["Company_name"].map(lambda x: process.extractOne(x, df_4["Company_name"])[0])

print(df_3)