import numpy as np
arr = np.array([[1,2,3],
                [4,5,6]])
print("array type: ", type(arr))
print("array shape: ", arr.shape)
print("array size: ", arr.size)
print("array dimension: ", arr.ndim)
print("array datatype: ", arr.dtype)

# creating array from list with type float
a = np.array([[1,2,3],[4,5,6]], dtype = 'float')
print("Array: \n", a) #list value

b = np.array((1,2,3))
print("Array: \n", b) #tuple value

c = np.zeros((3, 4))
print ("An array initialized with all zeros:\n", c)
# Create a constant value array of complex type
d=np.full((3,3),6, dtype='complex')
print ("An array initialized with all 6s."
"Array type is complex: \n", d)
# Create an array with random values
e = np.random.random((2, 2))
print ("A random array:\n", e)

arr = np.array([[1, 2, 3, 4],
[5, 2, 4, 2],
[1, 2, 0, 1]])
newarr = arr.reshape(2, 2, 3)
print ("Original array:\n", arr)
print("---------------")
print ("Reshaped array:\n", newarr)