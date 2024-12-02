from fuzzywuzzy import fuzz
from fuzzywuzzy import process

Str1 = "Back"
Str2 = "Book"
Ratio = fuzz.ratio(Str1.lower(),Str2.lower())
print(Ratio)


# Ratio using FuzzyWuzzy

Str1 = "My name is Ali"
Str2 = "Ali is my name"
Ratio = fuzz.ratio(Str1.lower(),Str2.lower())
print(Ratio)


# Partial Ratio using FuzzyWuzzy

Str1 = "My name is Ali"
Str2 = "My name is Ali Abdaal"
print(fuzz.partial_ratio(Str1.lower(),Str2.lower()))


# Token Sort Ratio using FuzzyWuzzy

Str1 = "My name is Ali"
Str2 = "Ali is my name"
print(fuzz.token_sort_ratio(Str1,Str2))


# Token Set Ratio using FuzzyWuzzy

Str1 = "My name is Ali"
Str2 = "Ali is my name name"
print(fuzz.token_sort_ratio(Str1,Str2))
print(fuzz.token_set_ratio(Str1,Str2))

# Token Set Ratio using FuzzyWuzzy 2nd example

Str_A = 'Read the sentence - My name is Ali' 
Str_B = 'My name is Ali'
ratio = fuzz.token_set_ratio(Str_A, Str_B)
print(ratio)

# Process Module using FuzzyWuzzy

query = 'My name is Ali'
choices = ['My name Ali', 'My name is Ali', 'My Ali']  
# Get a list of matches ordered by score, default limit to 5
process.extract(query, choices)

print(process.extract(query, choices))