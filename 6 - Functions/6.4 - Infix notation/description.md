# 6.4 - Infix Notation

So far, we’ve been calling filter using prefix notation. With prefix notation you put the function name before the arguments. If a function takes two arguments, like filter does, DataWeave allows you to call it with infix notation. Infix notation has the following syntax:
```
<arg1> <function_name> <arg2>
```
This syntax is preferred for nearly every function that takes a lambda as its second argument. Here’s how the code above would look if we called filter using infix notation:

---
#### DW Script:
```dw
%dw 2.0
output application/json

var numbers = (1 to 5) // Generates [1, 2, ..., 5]
---
numbers filter ((n, idx) -> (n mod 2) == 1)
```
#### Output:
```json
[1,3,5]
```
---

This may not seem like a great advantage, but it allows you to easily chain together functions that take in and return the same data type. For example, we can string together two filter functions in a way that is easy to read and understand:

---
#### DW Script:
```dw
%dw 2.0
output application/json

var numbers = (1 to 5) // Generates [1, 2, ..., 5]
---
numbers
  filter ((n, idx) -> (n mod 2) == 1)
  filter ((n, idx) -> (n > 3))
```
#### Output:
```json
[5]
```
---

In this case, the Array if filtered on whether or not is odd, then filtered on whether or not the number is greater than 3.
> Notice the additional parentheses around the first lambda. The parenthesis around the lambdas help DataWeave determine where the lambda starts and ends.

## Exercise:

Filter this given array to just contain only numbers that are multiples of 5 using a lambda with infix notation.

---
#### Input:
```json
[4, 5, 32, 30, 45, 776, 1040, 103, 105]
```
---
