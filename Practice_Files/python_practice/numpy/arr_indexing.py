import numpy as np
arr = np.array([[-1, 2, 0, 4],
                [4, -0.5, 6, 0],
                [2.6, 0, 7, 8],
                [3, -7, 4, 2.0]])
temp = arr[:2, ::2]
print ("Array with first 2 rows and alternate"
"columns(0 and 2):\n", temp)

temp = arr[[0,1,2,3],
           [3,2,1,0]]
print ("\nElements at indices (0, 3), (1, 2), (2, 1),"
"(3, 0):\n", temp)

cond = arr > 0
temp = arr[cond]
print("\nElements greater than 0:\n", temp)