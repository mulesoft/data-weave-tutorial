# 7.2 - The map Function

This function satisfies a very common use case in integration development: transforming every item in an Array to something else. Just like `filter`, `map` takes two parameters, an Array and a lambda, however, the lambda is structured differently than the one in `filter`. Here's the type definition for `map`:
```
map(Array<T>, ((T, Number) -> R)): Array<R>
```
There are two type variables in this definition, `T`, and `R`. `T` represents the type of items that the *input* Array contains. `R` represents the type of items that *output* Array contains. Since `map`’s job is to transform every item in an Array, it makes sense that the type of items in the input Array and type of items in the output Array are different. Knowing this, the lambda definition makes sense:
```
((T, Number) -> R)
```
The lambda’s job is to take in each item of type `T` from the input Array, as well as the index of that item, and return a new item that will be used in the output Array. Enough with the definitions, let’s check out a simple example that adds 1 to every value in an input array:

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

## Exercise

Let's change the output type completely in the above script and output this instead:

----
#### Output
```json
[
  {
    "value": 2,
    "index": 0
  },
  {
    "value": 3,
    "index": 1
  },
  {
    "value": 4,
    "index": 2
  },
  {
    "value": 5,
    "index": 3
  },
  {
    "value": 6,
    "index": 4
  }
]
```
----
