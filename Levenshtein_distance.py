import Levenshtein as lev


Str1 = "Back"
Str2 = "Book"
result = lev.distance(Str1.lower(),Str2.lower())

print(result)