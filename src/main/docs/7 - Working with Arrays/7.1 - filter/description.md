# 7.1 - The filter Function (and Function Type Signatures)

Since `filter` was covered in the last tutorial, we’ll use this opportunity to learn another concept alongside this function. When dealing with functions, it’s important to know what kind of data is valid input, and what to expect as output. For example, we know the valid input to filter is an Array and a lambda, and it returns an Array. However, this isn’t quite descriptive enough because there is another function to be accounted for, the lambda. The lambda takes in two arguments, a single item of type Any, and a index of type Number. It returns a Boolean. We can use a syntax that is very close to DataWeave to define this:

```
filter(Array<Any>, ((Any, Number) -> Boolean)): Array<Any>
```

* Can you think of anything that is lacking with the above signature?

While the above signature is correct, it’s not as precise as it could be. Array<Any> could be Array\<Number\>, Array\<String\>, Array\<Object\>, etc. If you pass an Array\<Number\> to filter, it can not return Array\<String\>, it can only return Array\<Number\>. In addition, if you pass an Array\<Number\> to filter, the first parameter passed to the lambda could not be String either, it would have to be Number. Here’s a concrete example. You can mess with the code all you want, but you will never find a situation where `filter` does not adhere to the signature defined above:

---
#### Input
```json
[1,2,3,4,5,6,7,8,9,10]
```
#### DW Script
```dw
%dw 2.0
output json
---
payload filter (n) -> n > 5
```
#### Output
```json
[6,7,8,9,10]
```
---

How do we define this kind of relationship between the parameters types of a function? We use generics:

```
filter(Array<T>, ((T, Number) -> Boolean)): Array<T>
```

In the syntax above `T` serves as a type variable. `T` could be any type at all, but it must be the same throughout the signature. In other words, this signature is a guarantee that if you pass Array\<Number\> to filter, the first parameter to the lambda will be type Number, and the output will be Array\<Number\> as well. If you’re familiar with generics from other languages like Java or Scala, this should look familiar.

We’ve now arrived at our final type signature of filter. In conclusion, this:

```
filter(Array<T>, ((T, Number) -> Boolean)): Array<T>
```

is shorthand for, "filter is a function that takes 2 input parameters. The first parameter is an Array containing items of type T. The second parameter is a function. The function takes T as the type of its first parameter, and Number as the type of its second. It returns a Boolean. The filter function returns an Array containing items of type T."

Notice that this definition does not provide any contextual information on what the types represent. It doesn't tell us anything about why the `T` in Array\<T\>, and the `T` that is the first input to the function are the same (it only tells us that they must be the same). It doesn't tell us Number represents the index of the item the function is currently processing. It doesn’t tell us the Boolean value is used to determine if an item is removed from the input Array or not.

Given the input below which will be in the variable `payload`,
