# 6.2 - Lambdas

DataWeave provides multiple ways to create functions. Just like we have named functions, we have functions without names, called lambdas. A lambda is a value in DataWeave, just like a String, an Object, and a Boolean. The syntax for a lambda is like so:

```
(<arg1>, <arg2>, …, <argN>) -> body
```

Here’s how we might try to use a lambda in a DataWeave script:

---
#### DW Script
```dw
%dw 2.0
output json
---
() -> 2 + 3
```
#### Output
```json
<ERROR>
```
---

You may be wondering why the output was not 5 and in fact, why it is an error. Why didn’t the function execute and return 2 + 3? Remember that functions represent functionality and therefore so do lambdas. They don’t do anything unless you call them. The lambda never executes; it’s describing functionality, not executing it. Because of this, 5 is not passed to the writer, instead, DataWeave sends `() -> 2 + 3` as a value (just like a String). In turn, the writer tries to serialize it as JSON, but JSON does not support functions, hence the error.

How would we get the script to return 5? Recall that in order to call functions you need to use the following syntax:

```
<function_name>(<arg1>, <arg2>, …, <argN>)
```

But lambdas don’t have names, that’s the whole point! In order to force a lambda to execute, we  surround it in parentheses and append () to the end:

---
#### DW Script
```dw
%dw 2.0
output json
---
(() -> 2 + 3)()
```
#### Output
```json
5
```
---

> How would the script look if you didn’t surround the lambda in parentheses? Do you see a problem?

If this syntax seems awkward, it’s because we’re using lambdas in a way they’re not meant to be used. If you needed to accomplish the above script, you be better off having the body as 2 + 3. So what are lambdas good for?

Because lambdas are values just like Strings, we can assign them to variables. This effectively gives a name to an unnamed function and allows us to use a lambda just like a normal function:

---
#### DW Script
```dw
%dw 2.0
output json

var add = (n, m) -> n + m
---
add(2, 3)
```
#### Output
```json
5
```
---

But that’s not very useful either, we already have a nicer syntax for the same thing with the `fun` keyword. In the next section, we will see why lambdas are so important.

## Exercise

Create and call a lambda function that does the same as the `isOddNum` function from the previous exercise. The lambda should receive one parameter and return true if that parameter is an odd number, false otherwise. Use the lambda function to evaluate the value field of the payload:

---
#### Input:
```json
{
  "value": 2020
}
```

