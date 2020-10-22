# 4.1 - Variable Access

Like other languages, DataWeave has variables so that you can store values to use later on in your script. Think of variables as a container for your data. The name you give to the variable is just like putting a label on the outside of the container so you can easily find it later. Variables are useful for giving values names, and storing a calculation that would otherwise need to be repeated. To set a variable, use the following syntax:

```dw
var <var_name> = <expression>
```

An expression is something that returns a value, or is a value itself. This value can then be referenced using the variable name. Here’s an example of setting a variable to an explicit value:

---
#### DW Script:
```dw
%dw 2.0
output json
var mascot = "Max the Mule"
---
mascot
```
#### Output:
```json
"Max the Mule"
```
---

Variables are almost always declared in the header of the script, where you set other declarations.

## Exercise

Let's complete the last challenge again, but this time using a variable to avoid repeated expressions (in this case `payload.secondLevel`).

---
#### Input:
```json
{
  "id": 1,
  "id": 11,
  "secondLevel": {
    "id": 2,
    "id": 22,
    "thirdLevel": {
      "id": 3,
      "id": 33
    }
  }
}
```
#### Output:
```json
{
  "descendant": [
    1,
    2,
    3
  ],
  "multivalue": [
    1,
    11
  ],
  "multivalueSecondLevel": [
    2,
    22
  ],
  "multivalueThirdLevel": [
    3,
    33
  ],
  "allTheIds": [
    1,
    11,
    2,
    22,
    3,
    33
  ]
}
```
