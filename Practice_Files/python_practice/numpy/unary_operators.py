import numpy as np
arr=np.array([[1, 5, 6],
            [4, 7, 2],
            [3, 1, 9]])

#maximum element of arr
print("largest element is:", arr.max())
print("Row wise maximum elements:", arr.max(axis=1))

#minimum element of arr
print("minimum element is:", arr.min())
print("Row wise minimum elements:", arr.min(axis=1))

#sum of array elements
print ("Sum of all array elements:",arr.sum())

# cumulative sum along each row
print ("Cumulative sum along each row:\n",arr.cumsum(axis = 1))

