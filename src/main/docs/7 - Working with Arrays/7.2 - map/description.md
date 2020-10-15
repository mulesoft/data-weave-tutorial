# 7.2 - The map Function

`map` satisfies a very common use case in integration development: transforming every item in an Array to something else. Just like filter, map take two parameters, an Array and a lambda, however, the lambda is structured differently than the one in filter. Here’s the type definition for map:
```
map(Array<T>, ((T, Number) -> R)): Array<R>
```
There are two type variables in this definition, `T`, and `R`. `T` represents the type of items that the input Array contains. `R` represents the type of items that output Array contains. Since `map`’s job is to transform every item in an Array, it makes sense that the type of items in the input Array and type of items in the output Array are different. Knowing this, the lambda definition makes sense:
```
((T, Number) -> R)
```
The lambda’s job is to take in each item of type `T` from the input Array, as well as the index of that item, and return a new item that will be used in the output Array. Enough with the definitions, let’s check out a simple example:

---

#### Input
```json
[1,2,3,4,5]
```
#### DW Script
```dw
%dw 2.0
output json
---
payload map (n, idx) -> n + 1
```
#### Output
```json
[2,3,4,5,6]
```
---

That script adds 1 to every value in the input Array.

- Change the above script to use the dollar-sign syntax ($, $$, etc.) instead.
- Change the above script to output this instead:
```
[
  {
    "value": 2,
    "index": 0
  },
  {
    "value": 3,
    "index": 1
  },
  ...
]
```

- A common use case for map is to make small changes to an existing payload, like renaming keys and formatting values. Transform the payload below with map so that all keys are camel case and all values are upper case.

---
#### Input
```json
[
  {"First Name": "Max", "Last Name": "The Mule"},
  {"First Name": "Albert", "Last Name": "Einstein"}
]
```
#### DW Script
```
%dw 2.0
output json
---
payload
```
#### Output
