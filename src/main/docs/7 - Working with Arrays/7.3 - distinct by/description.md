# 7.3 - The distinctBy Function

The distinctBy function is useful for when you need to remove duplicate items from an Array. Here’s the function signature:
```
distinctBy(Array<T>, ((T, Number) -> Any)): Array<T>
```
Aside from the lambda returning Any, this function signature is identical to filter. The lambda passed to distinctBy should return a value that is unique to each item in the input Array. You can define that value any way you need to. A typical use case would be remove duplicate Objects in an Array based on an id value:

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

* Modify the script above to use the (() -> ) lambda notation instead of the dollar-sign notation.

You might also need to combine multiple values in an Object to determine uniqueness. To do that, you can turn them into Strings and concatenate them with ++ to create the unique value:

---
#### Input
```json
[
  {"orderId": "1", "lineId": "1", "item": "toothpaste"},
  {"orderId": "1", "lineId": "2", "item": "floss"},
  {"orderId": "2", "lineId": "3", "item": "toothbrush"},
  {"orderId": "2", "lineId": "4", "item": "mouth wash"},
  {"orderId": "2", "lineId": "4", "item": "mouth wash"}
]
```
#### DW Script
```dw
%dw 2.0
output json
---
payload distinctBy (order, idx) ->
  order.orderId ++ order.lineId
```
#### Output
```json
[
  {"orderId": "1", "lineId": "1", "item": "toothpaste"},
  {"orderId": "1", "lineId": "2", "item": "floss"},
  {"orderId": "2", "lineId": "3", "item": "toothbrush"},
  {"orderId": "2", "lineId": "4", "item": "mouth wash"}
]
```
---

* When distinctBy finds a duplicate, does it use the original value in the output, or the found duplicate value? For example, what will the script below return?
```
[{id: 1, num: 1}, {id: 1, num: 2}] distinctBy $.id
```
`[{"id": 1, "num": 1}]` or `[{"id": 1, "num": 2}]`?

* After the distinctBy function, use map so the output is an Array of Objects with only an "item" key.
