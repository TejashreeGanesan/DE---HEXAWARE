# some missing values
import numpy as np
import pandas as pd
NaN = np.nan
dataframe = pd.DataFrame({'Name': ['Shobhit', 'Vaibhav','Vimal', 'Sourabh','Rahul', 'Shobhit'],
'Physics': [11, 12, 13, 14, NaN, 11],
'Chemistry': [10, 14, NaN, 18, 20, 10],
'Math': [13, 10, 15, NaN, NaN, 13]})

count_non_null = dataframe.count(axis=0)
print(count_non_null)
null_val = dataframe.isnull()
print(null_val)
nullval_per_sub = dataframe.isnull().sum()
print(nullval_per_sub)
total_null = dataframe.isnull().sum().sum()
print(total_null)