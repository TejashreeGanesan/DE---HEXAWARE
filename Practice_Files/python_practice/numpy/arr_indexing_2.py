import numpy as np
#fancy indexing
arr = np.array([10,20,30,40,50])
indices = [0,2,4]
print(arr[indices])

#ellips(...) in indexing
cube = np.random.rand(4,4,4)
print(cube[...,0])

#np.newaxis
arr = np.array([1,2,3])
print(arr[:,np.newaxis])

#modifying array elements
arr = np.array([1,2,3,4])
arr[1:3] = 99
print(arr)