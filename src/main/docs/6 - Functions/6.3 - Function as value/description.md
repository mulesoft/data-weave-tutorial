# 6.3 - Functions as Values

The usefulness of lambdas becomes apparent when we combine two ideas:

* Lambdas are values just like Strings, Objects, and Booleans
* Values can be passed to functions as arguments, as well as returned from functions.

In other words, lambdas become useful when you want to pass functions as arguments to other functions, or return a function from a function. A function that does this is referred to as a higher-order function (HOF). HOFs are easier to understand once you’re familiar with how to use one. Here’s an example of using a HOF, filter, to make sure an Array only contains odd numbers:

---
#### Input:
```json
```
#### DW Script:
```dw
%dw 2.0
output json

fun isOdd(n) =
  (n mod 2) == 1

var numbers = (1 to 5) // Generates [1, 2, ..., 5]
---
filter(numbers, (n, idx) -> isOdd(n))
```
#### Output:
```json
[1,3,5]
```
---

`filter` takes two arguments, an Array and a Lambda. In situations like these, it’s important to specify what the lambda should do as well. In the case of `filter`, the lambda should take in two arguments: an item in the Array, and the index of that particular item. It should return a Boolean. This Boolean value is used to determine if a value is in the returned Array or not. It is the responsibility of the receiving function to pass arguments into the lambda you specified, and do something with the return value. We’ll dig into how `filter` works to gain a deeper understanding of HOFs in general.

`filter` uses the lambda on each item of the Array in turn to determine whether it should be in the returned Array. If `filter` calls the lambda with 1, it returns `true`, so 1 makes it to the output Array. If `filter` calls the lambda with 2, it returns `false`, so 2 does not make it to the output Array. This goes on until the last item of the Array is reached, then the final Array is returned.

While the code above is ok, it’s a little inconvenient. We had to give a name to the function in order to use it, even though we were never going to use it again. This is exactly where lambdas come in. They enable use to pass functions to other functions without the inconvenience of having to think up a name for them:

---
#### DW Script:
```dw
%dw 2.0
output json

var numbers = (1 to 5) // Generates [1, 2, ..., 5]
---
filter(numbers, (n, idx) -> (n mod 2) == 1)
```
#### Output:
```json
[1,3,5]
```
---

## Exercise:

Filter this given array to just contain only numbers that are greater than 3 using a lambda.

---
#### Input:
```json
[0, 5, -32, 4, 66, 776, 3, 10, 1]
```
---
