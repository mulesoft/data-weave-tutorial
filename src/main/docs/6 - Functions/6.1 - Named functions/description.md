# 6.1 - Named Functions

We create functions in the declarations section of the script using the `fun` keyword. This associates a set of functionality with a name. Here’s the basic syntax:

```
fun <function_name>(<arg1>, <arg2>, …, <argN>) = <body>
```

It’s usually good form to put the body on a new line and indent.

You can call functions with the following syntax:

```
<function_name>(<arg1>, <arg2>, …, <argN>)
```

Here’s a simple example of creating a function and calling it:

---
#### DW Script:
```dw
%dw 2.0
output json

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

> Notice that there is no return keyword. A return keyword isn’t needed because almost everything in DataWeave is an expression, and all expressions return data.

It is often useful to create a _scope_ for functions, where we can declare variables and even more functions. Scopes are created using the `do` statement and work by making everything defined on its header available for use on its body but not beyond that limit.

In the example below, the `diff` function uses a scope to define two variables available only to the function itself:

---
#### DW Script:
```dw
%dw 2.0
output json

fun diff(n) = do {
  var start = n[0]
  var end = n[-1]
  ---
  end - start
}

---
diff([1990, 1995, 2002, 2008, 2021])
```
#### Output:
```json
31
```
---

## Exercise:

Create an `isOddNum` function that receives one parameter and returns true if is an odd number or false if not. You can use the `mod` function in the body of the `isOddNum` function. It returns the modulo (the remainder after dividing the dividend by the divisor). Use the function to evaluate the value field of the payload:

---
#### Input:
```json
{
  "value": 2021
}
```
