# 3.1 - Single Value Selector

The single-value selector (`.`) allows you to lookup Object values by their key. Here’s an example:

---
#### Input:
```json
{
  "name": "Ana",
  "age": 29
}
```
#### DW Script:
```dw
%dw 2.0
output json
—--
payload.age
```
#### Output:
```json
29
```
---

You can also use the single-value selector with square brackets instead of a period. This allows you to do useful things like using a dynamic key:

---
#### Input:
```json
{
  "name": "Ana",
  "age": 29,
  "dynamicKey": "age"
}
```
#### DW Script:
```dw
%dw 2.0
output json
—--
payload[payload.dynamicKey]
```
#### Output:
```json
29
```
---

If you’re dealing with a series of nested Objects, you can string together single-value selectors to get to the value you need.

## Exercise

Given the input below, string together selections to get to `"prod"`.

---
#### Input:
```json
{
  "environment": {
    "stage": "prod"
  },
  "host": "linux"
}
```
---
