# The filterObject function
---

The filterObject function is similar to the filter function, but instead of moving items from Arrays, the filterObject function removes key:value pairs from Objects. Here is its type signature:
```
filterObject(Object<K,V>, ((V,K,Number) -> Boolean)): Object<K,V>
```

Most of this is expected, filterObject takes in an Object and a lambda that returns a Boolean. It then returns an Object with the same types as the input Object. The key difference to be aware of as a developer is that the lambda takes three parameters instead of two. It takes the value, key, and index of the current iteration, so you can filter based on any of those parameters. 

Filtering by value works the same as with Arrays:

---
### Input
```json
{
  "name": "Jerry Schumann",
  "age": 34,
  "address": "123 Main Street"
}
```

### DW Script
```dw
%dw 2.0
output application/json
---
payload filterObject (value, key, index) -> value contains "Jerry"
```

### Output
```json
{
  "name": "Jerry Schumann"
}
```

> Filtering by index might seem odd for Objects because the order of key:value pairs is not normally significant, but in DataWeave it is. When indexing Objects for these functions, DataWeave starts at the top of the Object and works its way to the bottom:
---
### Input
```json
{
  "name": "Jerry Schumann",
  "age": 34,
  "address": "123 Main Street"
}
```

### DW Script
```dw
%dw 2.0
output application/json
---
payload filterObject (value, key, index) -> index == 2
```

### Output
```json
{
  "address": "123 Main Street"
}
```
---

Filtering by key deserves some attention, however:

---
### Input
```json
{
  "name": "Jerry Schumann",
  "age": 34,
  "address": "123 Main Street"
}
```

### DW Script
```dw
%dw 2.0
output application/json
---
payload filterObject (value, key, index) -> key == "age"
```

### Output
```json
{}
```
---

What happened?

- (Ch) Why wasn’t the output `{"age": 34}`? Hint: are there differences between the key and the String "age" in key == "age"?

All Object keys in DataWeave are of type Key, regardless of how the Object keys are created. The == operator tests if two values are equal, and part of that means checking that two values are the same type. This is why key == "age" returned false for every key:value pair in the input Object, Key == String is always false. How do you deal with this? There are three ways, you can:

1. cast the Key to a String with `key as String == "age"`,
2. cast the String to a Key with `key == "age" as Key`, or,
3. use the "similar to" operator, ~= instead of the "equal to" operator. `key ~= "age"`

- (Ch) Try the different options above to make sure you can get the `{"age": 34}` output.

The ~= operator and filterObject function usually go together. If you’re using filterObject to filter an Object based on a key, make sure you keep the ~= operator in mind!
