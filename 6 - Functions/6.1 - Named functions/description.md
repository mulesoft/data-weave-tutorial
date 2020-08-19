# 6.1 - Named Functions

We create functions in the declarations section of the script using the fun keyword. This associates a set of functionality with a name. Here’s the basic syntax:

```
fun <function_name>([<arg1>], [<arg2>], …, [<argN>]) = <body>
```

It’s usually good form to put the body on a new line and indent.


You can call functions with the following syntax:

```
<function_name>(<arg1>, <arg2>, …, <argN>)
```

Here’s a simple example of creating a function and calling it:

---
#### Input:
```json
```
#### DW Script:
```dw
%dw 2.0
output application/json

fun add(n, m) =
  n + m
---
add(1,2)
```
#### Output:
```json
3
```
---

> Notice that there is no return keyword. A return keyword isn’t needed because most everything in DataWeave is an expression, and all expressions return data.

## Exercise:

Create an `isOddNum` function that receives one parameter and returns true if is an `odd` number or false if not. You can use the `mod` function in the body of the `isOddNum` function. It returns the modulo (the remainder after dividing the dividend by the divisor).
