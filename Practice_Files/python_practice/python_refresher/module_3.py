#List Methods
print("\n=== List Methods ===")
numbers = [10, 20, 30, 40, 50]
print("Original List:", numbers)

#append
print("=== Append ===")
numbers.append(60)
print("After append(60):", numbers)

#clear
print("=== Clear ===")
num = [10, 20, 30, 40, 50]
print("After clear:", num)

#copy
print("=== Copy ===")
copy_numbers = numbers.copy()
print("Copy of list:", copy_numbers)

# count() 
print("=== Count ===")
numbers.append(20)
print("After appending 20 again:", numbers)
print("Count of 20:", numbers.count(20))

# extend() 
print("=== Extend ===")
numbers.extend([70, 80])
print("After extend([70, 80]):", numbers)

# index() 
print("=== Index ===")
print("Index of 30:", numbers.index(30))

# insert() 
print("=== Insert ===")
numbers.insert(2, 25)
print("After insert(2, 25):", numbers)

# pop() 
print("=== Pop ===")
removed = numbers.pop(3)
print(f"After pop(3) removed {removed}:", numbers)

# remove() 
print("=== Remove ===")
numbers.remove(20)
print("After remove(20):", numbers)

# reverse() 
print("=== Reverse ===")
numbers.reverse()
print("After reverse:", numbers)

# sort() 
print("=== Sort ===")
numbers.sort()
print("After sort (Asec):", numbers)

# Sort in descending order
print("=== Sort in Desc ===")
numbers.sort(reverse=True)
print("After sort(Desc):", numbers)


#List Slicing
print("\n=== List Slicing ===")
print("Sliced numbers:", numbers[2:5])

#Slice From the Start
print("=== Slice From the Start ===")
print("Slice From the Start", numbers[:5])

#Slice To the End
print("=== Slice To the End ===")
print("Slice To the End", numbers[2:])

#Negative Indexing
print("=== Negative Indexing ===")
print("Negative Indexing", numbers[-5:-2])

#Dictionary
print("\n=== Dictionary ===")
person = {"age": 25, "height": 175, "weight": 70}
print("Original Dictionary:", person)

# copy() 
print("=== copy ===")
person_copy = person.copy()
print("Copy of dictionary:", person_copy)

#clear
print("=== clean ===")
cln = person_copy.clear()
print("After clear:", cln)

# fromkeys() 
print("=== fromkeys() ===")
keys = ["id", "score", "level"]
new_dict = dict.fromkeys(keys, 1)
print("Fromkeys:", new_dict)

#items
print("=== items() ===")
print("Items:", list(person.items()))

#keys
print("=== keys() ===")
print("Keys:", list(person.keys()))

# pop() 
print("=== pop() ===")
removed_value = person.pop("height")
print("After heigt removed:", person)

# popitem() 
print("=== popitem() ===")
last_item = person.popitem()
print("After last item removed", person)

# setdefault() 
print("=== setdefault() ===")
print("Setdefault (weight):", person.setdefault("weight", 65))  
print("Setdefault (salary):", person.setdefault("salary", 50000))  
print("After setdefault:", person)

# update() 
print("=== update() ===")
person.update({"age": 30, "city": "New York"})
print("After update:", person)

# values() 
print("=== value() ===")
print("Values:", list(person.values()))

print("\n=== Set Methods ===")
a = {1, 2, 3, 4, 5}
b = {4, 5, 6, 7}
print("a: ", a)
print("b: ", b)

print("=== add() ===")
b.add(2)
print("Add: ", b)

print("=== difference() ===")
print("a difference b: ", a.difference(b))

print("=== intersection() ===")
print("a intersection b: ", a.intersection(b))

print("=== isdisjoint() ===")
print("a isdisjoint:", a.isdisjoint({100, 200}))

print("=== issubset() ===")
print("{4,5} issubset b:", {4, 5}.issubset(b))

print("=== issuperset() ===")
print("a issuperset {1,2}:", a.issuperset({1, 2}))

print("=== union() ===")
print("a union b:", a.union(b))

print("=== symmetric_difference() ===")
print("a symmetric_difference b:", a.symmetric_difference(b))

print("\n=== Map Methods ===")
a = [1, 2, 3]
b = [4, 5, 6]
res = map(lambda x, y: x + y, a, b)
print(list(res))
print("=== Converting to uppercase ===")
fruits = ['apple', 'banana', 'cherry']
res = map(str.upper, fruits)
print(list(res))
