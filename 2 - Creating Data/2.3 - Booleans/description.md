# Booleans

This is the last simple type we’ll cover in this tutorial. The `Boolean` type only has two values: true and false.

---
## DW Script:
```dw
%dw 2.0
output application/json
---
{
  "yes": true,
  "no": false
}
```
## Output:
```
{
  "yes": true,
  "no": false
}
```
---

Booleans are valuable when it comes to conditional logic (i.e., “if something is true, do this, if it’s false, do that”) which we will cover in another tutorial.

## Exercise

Combine the last few examples to create this output:

```json
{
  "string": "String",
  "number": "Number",
  "boolean": "Boolean"
}
```
