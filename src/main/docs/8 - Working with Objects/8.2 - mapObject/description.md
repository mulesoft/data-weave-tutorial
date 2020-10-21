# 8.2 - The mapObject function

This function has the same relation to `map` that `filterObject` has to `filter`. In this case, `mapObject` transforms an Object to an new Object instead of an Array to a new Array. Here's the type signature for `mapObject`:
```
mapObject(Object<K,V>, (V,K,Number) -> Object): Object
```
It takes in an Object, and a lambda that takes in 3 parameters, a value, key, and index, and returns a new Object. Finally, the entire function returns an Object.

We use `mapObject` when we want to change the keys and/or values on an Object to be something else. For example, making all the keys upper case:

---
#### Input
```json
{
  "firstName": "Avery",
  "lastName": "Chance",
  "age": 56,
  "occupation": "Physicist"
}
```
#### DW Script
```dw
%dw 2.0
output json
---
payload mapObject (value, key, index) -> {
  (upper(key)): value
}
```
#### Output
```json
{
  "FIRSTNAME": "Avery",
  "LASTNAME": "Chance",
  "AGE": 56,
  "OCCUPATION": "Physicist"
}
```
---

> The parentheses around `upper(key)` are required to make the key dynamic, as seen in previous sections.

## Exercise

Let's combine what we just learned with what we have also learned about arrays to transform all objects in the following array, so their keys are lower case and their values are upper case.

----
#### Input
```json
[
  {"First Name": "Max", "Last Name": "The Mule"},
  {"First Name": "Albert", "Last Name": "Einstein"}
]
```
----
