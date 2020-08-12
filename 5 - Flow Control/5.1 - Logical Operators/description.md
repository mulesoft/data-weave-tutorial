
# Logical Operators

Logical operators allows to write true false kind of expression. 
For example:

```dw
var age = 2
---
age < 10
```

Returns true if the age is less than 10 or false if it is bigger.

## Operators

| Expression  | Label  |
|---|---|
|A > B| Greater than |
|A < B|Less than|
|A >= B|Greater than or equal to|
|A <= B|Less than or equal to|
|A == B|Equal to|
|A ~= B|Similar to|
|Not A|Logical negation|
|!A|Logical negation|
|A and B|Logical and|
|A or B|Logical or|

---

## Excercise


Given an input `payload`

```json
{
    "name": "Jhon"
}
```

return `true` if the name is `"Peter"` 