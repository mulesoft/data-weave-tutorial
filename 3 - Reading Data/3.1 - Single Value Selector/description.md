# Single Value Selector

The single-value selector (`.`) allows you to lookup Object values by their key. Here’s an example:

---
### Input:
```json
{
  "name": "Ana",
  "age": 29
}
```
### DW Script:
```dw
%dw 2.0
output application/json
—--
payload.age
```
### Output:
```json
29
```
---

You can also use the single-value selector with square brackets instead of a period. This allows you to do useful things like use a key that references a value stored in a variable:

---
### Input:
```json
{
  "name": "Ana",
  "age": 29
}
```
### DW Script:
```dw
%dw 2.0
output application/json
var ageKeyName = "age"
—--
payload[ageKeyName]
```
### Output:
```json
29
```
---

If you’re dealing with a series of nested Objects, you can string together single-value selectors to get to the value you need. Given the input below, use this to get to `"prod"`.

---
### Input:
```json
{
  "environment": {
    "stage": "prod"
  },
  "host": "linux"
}
```
---
