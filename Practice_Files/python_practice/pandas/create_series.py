import numpy as np
import pandas as pd

#creating empty series
ser = pd.Series()
print("Pandas Series:", ser)

#simple array
data = np.array(['H', 'E','X', 'A', 'W', 'A', 'R','E'])
ser = pd.Series(data)
print("Pandas Series:\n", ser)

#creating dataframe
df = pd.DataFrame()
print(df)

lst = ['Python', 'Java', 'C++', 'Csharp']
df = pd.DataFrame(lst)
print(df)

data = [["James","","Smith",30,"M",60000],
    	["Michael","Rose","",50,"M",70000],
    	["Robert","","Williams",42,"",400000],
    	["Maria","Anne","Jones",38,"F",500000],
    	["Jen","Mary","Brown",45,None,0]]
columns=['First Name','Middle Name','Last Name','Age','Gender','Salary']
 
# Create the pandas DataFrame
pandasDF=pd.DataFrame(data=data, columns=columns)
 
# print dataframe.
print(pandasDF)