# 4.2 - Logical Operators

Logical operators allow you to write `true`/`false` kind of expression.

## Operators

| Expression  | Label  |
|------|------|
|`A > B`| Greater than |
|`A < B`|Less than|
|`A >= B`|Greater than or equal to|
|`A <= B`|Less than or equal to|
|`A == B`|Equal to|
|`A != B`|Not equal to|
|`A ~= B`|Similar to|
|`not A`|Logical negation|
|`!A`|Logical negation|
|`A and B`|Logical and|
|`A or B`|Logical or|

For example, this script returns `true` if the age is less than 10 or `false` if it is bigger.

---
#### DW Script:
```dw
%dw 2.0
output json
var age = 2
---
age < 10
```
#### Output:
```json
true
```
---

## Exercise

Use operators to return `true` if the `name` field of your input is `"Max"`.

---
#### Input:
```json
{
    "name": "Max"
}
```
