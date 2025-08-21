import numpy as np
# Creating array from list with type float
a = np.array([[1, 2, 4], [5, 8, 7]], dtype = 'float')
print ("Array created using passed list:\n", a)
# Creating array from tuple
b = np.array((1 , 3, 2))
print ("\nArray created using passed tuple:\n", b)

print("\n==== Functions to create an arrays ====")
# Creating a 3X4 array with all zeros
c = np.zeros((3, 4))
print ("An array initialized with all zeros:\n", c)
# Create a constant value array of complex type
d = np.full((3, 3), 6, dtype = 'complex')
print ("An array initialized with all 6s."
"Array type is complex:\n", d)
# Create an array with random values
e = np.random.random((2, 2))
print ("A random array:\n", e)

print("\n ==== arange function ====")
# Create a sequence of integers
# from 0 to 30 with steps of 5
f = np.arange(0, 30, 5)
print ("A sequential array with steps of 5:\n", f)

print("\n ==== linspace function ====")

# Create a sequence of 10 values in range 0 to 5
g = np.linspace(0, 5, 10)
print ("A sequential array with 10 values between"
"0 and 5:\n", g)

print("\n ==== reshaped array ====")
arr = np.array([[1, 2, 3, 4],
[5, 2, 4, 2],
[1, 2, 0, 1]])
newarr = arr.reshape(2, 2, 3)
print ("Original array:\n", arr)
print("---------------")
print ("Reshaped array:\n", newarr)

print("\n ==== flatten array ====")
# Flatten array
arr = np.array([[1, 2, 3], [4, 5, 6]])
flat_arr = arr.flatten()
print ("Original array:\n", arr)
print ("Flattened array:\n", flat_arr)
