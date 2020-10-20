# 7.3 - The distinctBy Function

This function is useful for when you need to remove duplicate items from an Array. Here’s the function signature:
```
distinctBy(Array<T>, ((T, Number) -> Any)): Array<T>
```
Aside from the lambda returning Any, this function signature is identical to `filter`. The lambda passed to `distinctBy` should return a value that is unique to each item in the input Array. You can define that value any way you need to. A typical use case would be remove duplicate Objects in an Array based on an `id` value:

---
#### Input
```json
[
  {"id": "1", "environment": "dev"},
  {"id": "2", "environment": "test"},
  {"id": "3", "environment": "uat"},
  {"id": "4", "environment": "prod"},
  {"id": "2", "environment": "test"}
]
```
#### DW Script
```dw
%dw 2.0
output json
---
payload distinctBy $.id
```
#### Output
```json
[
  {"id": "1", "environment": "dev"},
  {"id": "2", "environment": "test"},
  {"id": "3", "environment": "uat"},
  {"id": "4", "environment": "prod"}
]
```
---

You might also need to combine multiple values in an Object to determine uniqueness.

## Exercise

Remove the duplicates from the `shoppingList` variable. You can concatenate the two ID fields into one unique value using the function `++`. This should be your output without duplicates:

---
#### Output
```json
[
  {"orderId": "1", "lineId": "1", "product": "toothpaste"},
  {"orderId": "1", "lineId": "2", "product": "floss"},
  {"orderId": "2", "lineId": "3", "product": "toothbrush"},
  {"orderId": "2", "lineId": "4", "product": "mouth wash"}
]
```
---

> When `distinctBy` finds a duplicate, does it use the original value in the output, or the found duplicate value? You can change the `item` value for one of the `mouth wash` Objects to find out.
