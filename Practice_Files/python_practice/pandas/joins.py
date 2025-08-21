import pandas as pd

a = pd.DataFrame()
d = {'id': [1, 2, 10, 12], 
     'val1': ['a', 'b', 'c', 'd']}

a = pd.DataFrame(d)

b = pd.DataFrame()
d = {'id': [1, 2, 9, 8],
     'val1': ['p', 'q', 'r', 's']}
b = pd.DataFrame(d)

print("\n Inner join")
df = pd.merge(a, b, on = 'id', how='inner')
print(df)

print("\n left join")
df = pd.merge(a, b, on = 'id', how='left')
print(df)

print("\n index join")
df = pd.merge(a, b, left_index=True, right_index=True)
print(df)

