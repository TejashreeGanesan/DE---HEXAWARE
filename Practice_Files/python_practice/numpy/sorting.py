import numpy as np

a = np.array([[1, 4, 2],
            [3, 4, 6],
            [0, -1, 5]])

#sorted array
print("Array elements in sorted order:\n", np.sort(a, axis=None))

#sort array row-wise
print("row wise sorted array:\n", np.sort(a, axis=1))

#specify sort algorithm
print("column wise sort by applying merge-sort:\n", np.sort(a,axis=0,kind='mergesort'))

#structured array
#set alias names for dtypes
dtypes = [('name', 'S10'), ('grad_year', int), ('cgpa', float)]
values = [('Hrithik', 2009, 8.5), ('Ajay', 2008, 8.7),
        ('Pankaj', 2008, 7.9), ('Aakash', 2009, 9.0)]
arr = np.array(values, dtype = dtypes)
print("\n Array sorted by names:\n", np.sort(arr,order='name'))

#creating array
arr = np.array(values, dtype = dtypes)
print("\n Array sorted by names:\n", np.sort(arr,order='name'))
print("\n Array sorted by graduation year and then cgpa:\n", 
      np.sort(arr, order=['grad_year','cgpa']))

