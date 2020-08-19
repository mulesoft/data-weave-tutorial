# 2.5 - Objects

Objects are a series of key-value mappings, where the value can be of any type:

---
#### DW Script:
```dw
%dw 2.0
output application/json
—--
{
  one: [1],
  two: "2"
}
```
#### Output:
```json
{
  "one": [1],
  "two": "2"
}
```
---

DataWeave allows repeated keys on Objects as well. This may seem odd, but the support for this makes sense when we consider XML:

---
```
<?xml version='1.0' encoding='UTF-8'?>
<titles>
  <title>Titanic</title>
  <title>Avatar</title>
</titles>
```
---

## Exercise

Use repeated keys to obtain the XML above as output.

> Change the output to be `application/json`. Are the keys still repeated? Is this valid JSON?
