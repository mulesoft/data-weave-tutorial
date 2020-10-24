# 7.4 - The reduce Function

The `reduce` function is about as close as we get to a general-purpose looping tool in DataWeave. It can be used to transform an `Array` to any other type. It can be used to perform the task of `map`, `filter`, `distinctBy`, `groupBy`, and other functions that take in Arrays. Here’s its function signature:
```
reduce(Array<T>, ((T, R) -> R)): R
```
With this signature we can start to see what it means for `reduce` to be general-purpose. It takes in an Array and a lambda. The lambda can return anything at all, an `Array`, `Object`, `String`, etc. Whatever the type that is returned from the lambda is the same type that is returned from `reduce`. A common example for reduce is to show how you can sum all of the numbers in an Array. It is not a very useful example as the `sum` function does just that but it gives a small glimpse of what `reduce` can be used for:

----
#### Input
```json
[1,2,3]
```
#### DW Script
```dw
%dw 2.0
output json
---
payload reduce (n, total) -> total + n
```
#### Output
```
6
```
----

Let’s use this example to discuss how `reduce` uses the lambda passed to it to generate the output. The lambda function is defined like this:
```
((T, R) -> R)
```
which should look pretty similar to the other functions we’ve seen in this tutorial. It takes in two parameters and returns one. The first parameter represents a particular item from the inbound Array. The second parameter, however, does not represent the current index. The second parameter represents the present value of the *accumulator*. What’s the accumulator? The accumulator is what stores what is potentially returned from `reduce`. The job of the lambda is to return a new accumulator for each iteration. After the last iteration, the accumulator is what finally gets returned from `reduce`.

To illustrate this concept more clearly, let’s take the last example step-by-step and see what’s happening.

For the first iteration, `reduce` does something special. If a default value is not declared for the accumulator, it uses the first item of the input Array, and passes the second item of the input. So for the first iteration the lambda is called like this:

----
#### First iteration (no default value provided)
Value = 2

Accumulator = 1
```
((2, 1) -> 1 + 2)
```
----

Which returns 3 and becomes the new value of the accumulator. `reduce` then moves on to the next iteration, which uses the third and final item in the Array. The lambda is called with the current value of the iteration, plus whatever the current value of the accumulator is:

----
#### Second iteration
Value = 3

Accumulator = 3
```
((3, 3) -> 3 + 3)
```
----

Which returns 6. Notice the first value is 3, the last value of the input Array, and the second value is 3 as well, because that was the previous value of the accumulator. Since this is the last value from the input Array, `reduce` returns the accumulator, which is 6 now.

This is how the same example looks with an initial accumulator value defined:

----
#### Input
```json
[1,2,3]
```
#### DW Script
```dw
%dw 2.0
output json
---
payload reduce (n, total = 100) -> total + n
```
#### Output
```
106
```
----

The accumulator for reduce could be any type. We’re not limited to accumulating values in a scalar like a Number or String, either. We could accumulate into a collection like an Array if we wanted, or even an Object. In fact, transforming from an Array to an Object is a very common task for `reduce`.

## Exercise

Use `reduce` to transform the input array into the object below. Keep in mind that the concatenation function `++` seen before for Strings also works between Objects as seen in the starting example, where you can also see how dynamic keys are defined in an Object.

----
#### Input
```json
[
  {"id": "1", "name": "dev"},
  {"id": "2", "name": "test"},
  {"id": "3", "name": "uat"},
  {"id": "4", "name": "prod"}
]
```
#### Output
```json
{
  "dev": "1",
  "test": "2",
  "uat": "3",
  "prod": "4"
}
```
