import numpy as np
cvalues = [20.1, 20.8, 21.9, 22.5, 22.7, 22.3,21.8, 21.2, 20.9, 20.1]
data = np.array(cvalues)
print(data)

fvalues = fvalues = [ x*9/5 + 32 for x in cvalues]
print(fvalues)

print(type(data))

#creation of arrays with evenly spaced values
print("\n creation of arrays with evenly spaced values")
a = np.arange(1,10)
print(a)
a_float = np.arange(1,10,0.2)
print(a_float)
x = range(1,10)
print(x)
print("\n Linspace")
print(np.linspace(1,10))
print(np.linspace(1,10,7))
print(np.linspace(1,10,7, endpoint = False))

