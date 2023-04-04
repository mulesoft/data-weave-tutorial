# 7.1 - The filter Function (and Function Type Signatures)

Since `filter` was covered in the last tutorial, we’ll use this opportunity to learn another concept alongside this function: type signatures. When dealing with functions, it’s important to know what kind of data is valid input, and what to expect as output. For example, we know the valid input to filter is an Array and a lambda, and it returns an Array. However, this isn’t quite descriptive enough because there is another function to be accounted for, the lambda. The lambda takes in two arguments, a single item of type Any, and a index of type Number. It returns a Boolean. We can use a syntax that is very close to DataWeave to define this:-

```
filter(Array<Any>, ((Any, Number) -> Boolean)) : Array<Any>
```

While the above signature is correct, it’s not as precise as it could be. Array<Any> could be `Array<Number>`, `Array<String>`, `Array<Object>`, etc. If you pass an `Array<Number>` to filter, it can not return `Array<String>`, it can only return `Array<Number>`. In addition, if you pass an `Array<Number>` to `filter`, the first parameter passed to the lambda could not be `String` either, it would have to be `Number`.

How do we define this kind of relationship between the parameters types of a function? We use generics:

```
filter(Array<T>, ((T, Number) -> Boolean)) : Array<T>
```

In the syntax above `T` serves as a type variable. `T` could be any type at all, but it must be the same throughout the signature. In other words, this signature is a guarantee that if you pass `Array<Number>` to filter, the first parameter to the lambda will be type `Number`, and the output will be `Array<Number>` as well. If you’re familiar with generics from other languages like Java or Scala, this should look familiar.

We’ve now arrived at our final type signature of `filter`, in proper DataWeave syntax:

```
fun filter <T>(items: Array<T> , criteria: (item: T, index: Number) -> Boolean): Array<T>
```

This is shorthand for, "`filter` is a function that takes 2 input parameters; the first parameter is an `Array` containing items of type `T`; the second parameter is a function which takes `T` as the type of its first parameter, `Number` as the type of its second and it returns a Boolean; finally, the `filter` function returns an `Array` containing items of type `T`".

Notice that this definition does not provide any contextual information on what the types represent. It doesn't tell us anything about why the `T` in `Array<T>`, and the `T` that is the first input to the function are the same (it only tells us that they must be the same). It doesn't tell us `Number` represents the index of the item the function is currently processing. It doesn’t tell us the `Boolean` value is used to determine if an item is removed from the input Array or not.

DataWeave can infer undeclared types in functions or variable definitions by analysing their context and usage, which is why we haven't seen them so far. However, making types explicit can help you reason about your code, among other benefits. Here's the basic syntax:

```
var <var_name>: <var_type> = <expression>
fun <function_name>(<arg1>: <arg1_type>,…, <argN>: <argN_type>) : <result_type> = <body>
```

## Exercise

Think about the types required and use the commented functions to filter the `movies` array so that only movies with an odd name length make it through.

> Functions in DataWeave can be overloaded (defined more than once) to handle different types: DataWeave will simply route the execution to the correct one given an input and its type. In this case, for example, both function definitions can be uncommented.
