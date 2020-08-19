# 2 - Creating Data

In this tutorial we will go over how to create:
* Numbers
* Strings
* Booleans
* Arrays
* Objects

These values have their respective types:
* `Number`
* `String`
* `Boolean`
* `Array`
* `Object` or `{}`

As you'd expect, the last two are actually composite types, their contents also have type definitions:
 * For an array, it means its type will be `Array<T>` where `T` is a type parameter that defines the type of the elements inside the array. So the type of an array of strings would be `Array<String>`.
* For objects, their key-value pairs could define types of their own. So the type of an object with a `name` string key would be `{name : String}`.

You can check the type of a value by using `typeOf`:

---
#### DW Script:
```dw
%dw 2.0
output application/json
—--
typeOf({})
```

#### Output:
```
“Object”
```
---

Keep in mind, DataWeave doesn’t need input data to generate output, so we won't be using input examples during this section.
