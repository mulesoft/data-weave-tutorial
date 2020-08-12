# Descendants Selector

The descendants selector (`..`) is the perfect tool to use when you need the values for a certain key no matter where they appear in a piece of data. Here’s an example:

---
### Input:
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
### DW Script:
```dw
%dw 2.0
output application/json
—--
payload..target
```
### Output:
```json
[{"hello": "world"}, "foo", "bar"]
```
---

Use what you've just learn to obtain an Array containing all of the values associated with any `name` key in the following input:

---
### Input:
```xml
<?xml version='1.0' encoding='UTF-8'?>
<customer>
  <name>Max the Mule</name>
  <locations>
    <name>Max’s house</name>
    <address>1234 Mule Street</address>
  </locations>
  <locations>
    <name>Max's cabin</name>
    <address>345 Lakeside Road</address>
  </locations>
</customer>
```
----
