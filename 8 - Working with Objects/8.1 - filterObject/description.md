# The filterObject function
---

The filterObject function is similar to the filter function, but instead of moving items from Arrays, the filterObject function removes key:value pairs from Objects. Here is its type signature:
```
filterObject(Object<K,V>, ((V,K,Number) -> Boolean)): Object<K,V>
```

Most of this is expected, filterObject takes in an Object and a lambda that returns a Boolean. It then returns an Object with the same types as the input Object. The key difference to be aware of as a developer is that the lambda takes three parameters instead of two. It takes the value, key, and index of the current iteration, so you can filter based on any of those parameters. 

Filtering by value works the same as with Arrays:


### Payload
```json
{
  "name": "Jerry Schumann",
  "age": 34,
  "address": "123 Main Street"
}
```

### DW Script
```
%dw 2.0
output application/json
---
payload filterObject (v,k,idx) -> v contains "Jerry"
```

### Expected Output
```json
{
  "name": "Jerry Schumann"
}
```