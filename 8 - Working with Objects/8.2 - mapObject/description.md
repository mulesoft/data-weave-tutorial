# The mapObject function

mapObject has the same relation to map that filterObject has to filter. In this case, mapObject maps an Object to an new Object instead of an Array to a new Array. Here’s the type signature for mapObject:

mapObject(Object<K,V>, (V,K,Number) -> Object): Object

mapObject takes in an Object, and a lambda that takes in 3 parameters, a value, key, and index, and returns a new Object. Finally, the entire function returns an Object.

We use mapObject when we want to change the keys and/or values on an Object to be something else. We might want to make all the keys upper case:

---
### Input
```
{
  "firstName": "Avery",
  "lastName": "Chance",
  "age": 56,
  "occupation": "Physicist"
}
```

### DW Script
```
%dw 2.0
output application/json
---
payload mapObject (value, key, index) -> {
  (upper(key)): value
}
```

### Output
```
{
  "FIRSTNAME": "Avery",
  "LASTNAME": "Chance",
  "AGE": 56,
  "OCCUPATION": "Physicist"
}
```
---

(Ch) What happens if you remove the parentheses around upper(k) in the DW script above?

mapObject is also useful when you need to be more precise and what parts of the Object you transform. For example, you might only want to modify the value for a certain key. You can use if/else to catch the key:value pair you want to modify, and pass through all the other key:value pairs without modifying them:

### Input
```
{
  "firstName": "Avery",
  "lastName": "Chance",
  "age": 56,
  "occupation": "Physicist"
}
```

### DW Script
```
payload mapObject (value, key, index) ->
  if (key ~= "age") 
    {
        (key): value + 1
    }
  else 
    {
        (key): value
    }
```

### Output
```
{
  "firstName": "Avery",
  "lastName": "Chance",
  "age": 57,
  "occupation": "Physicist"
}
```
---

- (Ch) Make a function, birthday, that takes in an Object, and increments the key "age" if found.

- (Ch) Make the birthday function more general by also allowing the user to supply the key. For example if the input object was the variable `var obj = {"yearsOld": 23, "age": 23}`, you could call the function like this: birthday(obj, "yearsOld"), and it would increment the "yearsOld" key instead of the "age" key.

- (Ch) Change the `~=` to `==`. Does the function still work? Why?