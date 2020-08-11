# Descendants Selector

The descendants selector (`..`) is the perfect tool to use when you need the values for a certain key no matter where they appear in a piece of data. Here’s an example:

---
## Input:
```json
{
  "target": {"hello": "world"},
  "data": [
    {
      "target": "foo",
      "more": {
        "target": "bar"
      }
    }
  ]
}
```
## DW Script:
```dw
%dw 2.0
output application/json
—--
payload..target
```
## Output:
```json
[{"hello": "world"}, "foo", "bar"]
```
---
