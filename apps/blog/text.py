
arr = ['a',"b","c","d","b","b","b","c","c","F"]
def all_list(arr):
    result = {}
    for i in set(arr):
        result[i] = arr.count(i)
    return result

q = all_list(arr)
print(q)
for i in q:
    print(q[i])