# 8.1 - The filterObject function

The `filterObject` function is similar to the `filter` function, but instead of removing items from Arrays, the `filterObject` function removes key-value pairs from Objects. Here is its type signature:
```
filterObject(Object<K,V>, ((V,K,Number) -> Boolean)): Object<K,V>
```
Most of this is expected, `filterObject` takes in an Object and a lambda that returns a Boolean. It then returns an Object with the same types as the input Object. The key difference to be aware of as a developer is that the lambda takes three parameters instead of two. It takes the value, key, and index of the current iteration, so you can filter based on any of those parameters.

Filtering by value works the same as with Arrays. Filtering by index might seem odd for Objects because the order of key-value pairs is not normally significant, but in DataWeave it is. When indexing Objects for these functions, DataWeave starts at the top of the Object and works its way to the bottom. It's filtering by key that deserves some attention:

---
#### Input
```json
{
  "name": "Jerry Schumann",
  "age": 34,
  "address": "123 Main Street"
}
```
#### DW Script
```dw
%dw 2.0
output json
---
payload filterObject (value, key, index) -> key == "age"
```
#### Output
```json
{}
```
---

What happened? Well, we've hinted at this before.

All Object keys in DataWeave are of type `Key`, regardless of how the Object keys are created. The ``==`` operator tests if two values are equal, and part of that means checking that two values are the same type. This is why `key == "age"` returned false for every key-value pair in the input Object, `Key == String` is always false. How do you deal with this? There are three ways, you can:

1. Cast the Key to a String with `key as String == "age"`.
2. Cast the String to a Key with `key == "age" as Key`.
3. Use the "similar to" operator (`~=`), instead of the "equal to" operator (`==`), as `key ~= "age"`

The `~=` operator and `filterObject` function usually go together. If you’re using filterObject to filter an Object based on a key, make sure you keep the `~=` operator in mind!

## Exercise

Given the following object, remove all key-value pairs with "secret" related keys and `false` values. You can see in the starting example, the `contains` function working with Strings which will be helpful.

----
#### Input
```json
{
    "name": "Jerry",
    "middle_name": false,
    "last_name": "Schumann",
    "secret_key": "903mg20mgg4",
    "secret_password": "d0n0tH4ckm3PLiZ",
    "question_secret": "Do you wish to get hacked?",
    "personal_token": false
}
```
