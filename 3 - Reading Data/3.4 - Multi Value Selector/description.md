# Multi Value Selector

The multi-value selector (`.*`) returns an Array containing any value that matches the key. The values returned are dependent on the key that’s passed in. The multi-value selector works on both Arrays and Objects, but in different ways. Let’s check out Arrays first:

---
### Input:
```json
[
  {
    "number": 1,
    "number": 2
  },
  {
    "number": 3,
    "number": 4
  },
  {
    "number": 5,
    "number": 6
  },
  {
    "string": "foo"
  }
]
```
### DW Script:
```dw
%dw 2.0
output application/json
—--
payload.*number
```
### Output:
```json
[1, 2, 3, 4, 5, 6]
```
---

In this case, the multi-value selector will go through each item in the Array and apply the key as if it were a single-value selector. It’s like DW is evaluating payload[0].number, then payload[1].number, etc., and collecting those values into an Array.

Let’s see how the multi-value selector works on Objects:

---
### Input:
```json
{
  "number": 1,
  "number": 2,
  "number": 3,
  "string": 4
}
```
### DW Script:
```dw
%dw 2.0
output application/json
—--
payload.*number
```
### Output:
```json
[1, 2, 3]
```
---

The multi-value selector works on Objects by getting the value for every key that matches. This works great when you’re dealing with data with repeating keys. This might seem a little weird for JSON, but consider a similar example in XML, you will see why the multi-value selector is a very important selector to know. Use it to get an Array of all `number` values in this input:

---
### Input:
```xml
<data>
  <number>1</number>
  <number>2</number>
  <number>3</number>
  <string>Hello</string>
</data>
```
---

* (Ch) Try using a single-value selector instead. What happens? Does it return the first occurrence, or last?
