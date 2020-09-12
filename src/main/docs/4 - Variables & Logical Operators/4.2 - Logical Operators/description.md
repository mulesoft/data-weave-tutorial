# 4.2 - Logical Operators

Logical operators allow you to write `true`/`false` kind of expression.
For example:

```dw
var age = 2
---
age < 10
```

Returns `true` if the age is less than 10 or `false` if it is bigger.

## Operators

| Expression  | Label  |
|---|---|
|A > B| Greater than |
|A < B|Less than|
|A >= B|Greater than or equal to|
|A <= B|Less than or equal to|
|A == B|Equal to|
|A ~= B|Similar to|
|not A|Logical negation|
|!A|Logical negation|
|A and B|Logical and|
|A or B|Logical or|

---

## Exercise

Given an input `payload`

```json
{
    "name": "John"
}
```

return `true` if the name is `"Peter"`
