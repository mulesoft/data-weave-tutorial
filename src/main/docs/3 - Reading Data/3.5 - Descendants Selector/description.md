# 3.5 - Descendants Selector

The descendants selector (`..`) is the perfect tool to use when you need the values for a certain key no matter where they appear in a piece of data. Here’s an example:

---
#### Input:
```json
{
  "echo": {"value": "Hello there!"},
  "sequence": [
    {
      "echo": "Getting details...",
      "try": {
        "curl": "somelocation.com",
        "echo": "Success!"
      }
    },
    {
      "grep": "Success"
    }
  ]
}
```
#### DW Script:
```dw
%dw 2.0
output json
---
payload..echo
```
#### Output:
```json
[{ "value": "Hello there!"}, "Getting details...", "Success!"]
```
---

> This selector can be combined with the multi value selector to also find repeated keys.

## Exercise

Use what you've just learn to obtain an Array containing all of the values associated with any `name` key in the following XML:

---
#### Input:
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
