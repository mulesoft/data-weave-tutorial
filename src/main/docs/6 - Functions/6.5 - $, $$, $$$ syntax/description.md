# 6.5 - \$, \$\$, \$\$\$ Syntax

HOFs are so prolific in DataWeave’s library that there are additional syntax features that make them easier to use. For functions that DataWeave provides, you can represent the first, second, and third arguments of the passed lambda as `$`, `$$`, and `$$$`, respectively. When you do this, you do not need to specify the arguments of the lambda when you pass it to the function. Here’s our odd number filter example from earlier using the dollar-sign syntax:

---
#### DW Script:
```dw
%dw 2.0
output json

var numbers = (1 to 5)
---
numbers filter (($ mod 2) == 1)
```
#### Output:
```json
[1,3,5]
```
---

The dollar-sign syntax gives us all the same functionality as when we reference something by its name. This means we can chain selectors and indexes right off of the dollar-sign in order to query data:

---
#### Input:
```json
[
  {
    "id": 1,
    "item": "cheese",
    "price": 4.00  
  },
  {
    "id": 2,
    "item": "steak",
    "price": 15.00  
  },
  {
    "id": 3,
    "item": "cereal",
    "price": 5.00  
  },
  {
    "id": 4,
    "item": "apples",
    "price": 2.00  
  }
]
```
#### DW Script:
```dw
%dw 2.0
output application/json
---
payload filter $.price > 5
```
#### Output:
```json
[
  {
    "id": 2,
    "item": "steak",
    "price": 15.00  
  }
]
```
---

## Exercise

Using the dollar-sign syntax, filter the following Array so it only contains users whose names start with `"C"`.

---
#### Input:
```json
[
  {
    "name": "Jonas",
    "family": "Kahnwald"
  },
  {
    "name": "Mikke",
    "family": "Nielsen"
  },
  {
    "name": "Claudia",
    "family": "Tiedemann"
  },
  {
    "name": "Martha",
    "family": "Nielsen"
  },
  {
    "name": "Charlotte",
    "family": "Doppler"
  }
]
```
---
