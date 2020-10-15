# 3.3 - Range Selector

If you need multiple sequential values from an Array, DataWeave allows you to select a range of values with the range selector (`[n to m]`). Instead of returning a single value like the index selector does, it will return an Array of values:

---
#### Input:
```json
["prod", "qa", "dev"]
```

#### DW Script:
```dw
%dw 2.0
output application/json
—--
payload[0 to 1]
```
#### Output:
```json
["prod", "qa"]
```
---

Just like with the index selector, negative indexes can be used to select a range of values starting from the end of the Array.

## Exercise

Use negative indexes to obtain the reverse order of the above input.
