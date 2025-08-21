import numpy as np
import pandas as pd

NaN = np.nan
df = pd. DataFrame({'Name': ['Shobhit', 'Vaibhav','Vimal', 'Sourabh','Rahul', 'Shobhit'],
'Physics': [11, 12, 13, 14, NaN, 11],
'Chemistry': [10, 14, NaN, 18, 20, 10],
'Math': [13, 10, 15, NaN, NaN, 13]})
print("Created DataFrame")
print(df)

#find count of all columns
print("Count of all values wrt columns")
print(df.count(axis=1))
print(df.count(axis='columns'))

#count null values
