import numpy as np

print("\n ==== Initialize a Python NumPy Array Using Special Functions ===")
zeros_array = np.zeros((2, 3))
ones_array = np.ones((3, 3))
constant_array = np.full((2, 2), 7)
range_array = np.arange(0, 10, 2)  # start, stop, step
linspace_array = np.linspace(0, 1, 5)  # start, stop, num

print("Zero Array:","\n",zeros_array)
print("Ones Array:","\n",ones_array)
print("Constant Array:","\n",constant_array)
print("Range Array:","\n",range_array)
print("Linspace Array:","\n",linspace_array)

print("\n ==== Create Python Numpy Arrays Using Random Number Generation ===")
random_array = np.random.rand(2, 3)
normal_array = np.random.randn(2, 2)
randint_array = np.random.randint(1, 10, size=(2, 3))  

print(random_array)
print(normal_array)
print(randint_array)

print("\n ==== Create Python Numpy Arrays Using Matrix Creation Routines ===")
identity_matrix = np.eye(3)
diagonal_array = np.diag([1, 2, 3])
zeros_like_array = np.zeros_like(diagonal_array)
ones_like_array = np.ones_like(diagonal_array)

print(identity_matrix)
print(diagonal_array)
print(zeros_like_array)
print(ones_like_array)