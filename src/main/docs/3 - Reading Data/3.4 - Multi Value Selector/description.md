# 3.4 - Multi Value Selector

The multi-value selector (`.*`) returns an Array containing any value that matches the key. The values returned are dependent on the key that’s passed in. The multi-value selector works on both Arrays and Objects, but in different ways. Let’s check out Arrays first:

---
#### Input:
```json
[
  {
    "price": 1,
    "price": 2
  },
  {
    "price": 3,
    "price": 4
  },
  {
    "price": 5,
    "price": 6
  },
  {
    "name": "Starburst",
    "category": "Candy"
  }
]
```
#### DW Script:
```dw
%dw 2.0
output json
---
payload.*price
```
#### Output:
```json
[1, 2, 3, 4, 5, 6]
```
---

In this case, the multi-value selector will go through each item in the Array and apply the key as if it were a single-value selector. It’s like DW is evaluating payload[0].number, then payload[1].number, etc., and collecting those values into an Array.

Let’s see how the multi-value selector works on Objects:

---
#### Input:
```json
{
  "name": "Emilia",
  "name": "Isobel",
  "name": "Euphemia",
  "name": "Rose",
  "surname": "Clarke"
}
```
#### DW Script:
```dw
%dw 2.0
output json
---
payload.*name
```
#### Output:
```json
["Emilia", "Isobel", "Euphemia", "Rose"]
```
---

The multi-value selector works on Objects by getting the value for every key that matches. This works great when you’re dealing with data with repeating keys. This might seem a little weird for JSON, but consider a similar example in XML, you will see why the multi-value selector is a very important selector to know.

## Exercise

Use the multi-value selector to get an Array of all `title` values in this input:

---
#### Input:
```xml
<movies>
  <title>The Terminator</title>
  <title>Titanic</title>
  <title>Avatar</title>
  <director>James Cameron</director>
</movies>
```
---

> Try using a single-value selector instead. What happens? Does it return the first occurrence, or last?
