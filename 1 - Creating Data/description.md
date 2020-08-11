In this tutorial we will go over how to create:
* Numbers
* Strings
* Booleans
* Arrays
* Objects

TODO: Add in type definitions and briefly explain what they mean. This should prime readers for when they hit the functions sections and we describe function signatures.


# Intro

DataWeave doesn’t need input data to generate output. For example, the following script takes no input, it just outputs the String “Hello”:

---
##Input:
```
```

##DW Script:
```dw
%dw 2.0
output application/json
—--
"Hello"
```
##Output:
```
"Hello"
```
---

DataWeave also supports numbers with the Number type. The Number type supports both integer and floating-point numbers:

---
##Input:
```
```

##DW Script:
```dw
%dw 2.0
output application/json
—--
1
```
##Output:
```
1
```
---

You can check the type of a value by using typeOf:

---
##Input:
```
```

##DW Script:
```dw
%dw 2.0
output application/json
—--
typeOf(1)
```

##Output:
```
“Number”
```
---

* (Ch) change the number to a decimal like 3.14. Why doesn’t the output change?

The last simple type we’ll cover in this tutorial is the Boolean type. The Boolean type only has two value values: true and false.

---
##Input:
```
```

##DW Script:
```dw
%dw 2.0
output application/json
---
{
  “true”: true,
  “false”: false
}
```
##Output:
```
{
  “true”: true,
  “false”: false
}
```
---

Booleans are valuable when it comes to conditional logic (i.e., “if something is true, do this, if it’s false, do that”) which we will cover in the next tutorial.

In addition to Strings, Numbers and Booleans, DataWeave also supports collections with Arrays, and Objects. Arrays are an ordered series of values where the values can be of any type:

---
##Input:
```
```

##DW Script:
```dw
%dw 2.0
output application/json
—--
[“1”, 2, “3”, 4, “five”]
```
##Output:
```
[“1”, 2, “3”, 4, “five”]
```
---

Objects are a series of key-value mappings, where the value can be of any type:

---
##Input:
```
```

##DW Script:
```dw
%dw 2.0
output application/json
—--
{
  one: 1,
  two: “2”
}
```
##Output:
```
{
  “one”: 1,
  “two”: “2”
}
```
---

DataWeave allows repeated keys on Objects as well:

---
##Input:
```
```
##DW Script:
```dw
%dw 2.0
output application/json
—--
{
  number: 1,
  number: 2
}
```
##Output:
```
{
  “number”: 1,
  “number”: 2
}
```
---

This may seem like a bug, but the support for this makes sense when we consider how to create repeated keys for XML:

---
##Input:
```
```
##DW Script:
```dw
%dw 2.0
output application/xml
—--
{
  numbers: {
    number: 1,
    number: 2
  }
}
```
##Output:
```
<?xml version='1.0' encoding='UTF-8'?>
<numbers>
  <number>1</number>
  <number>2</number>
</numbers>
```
---

* (Ch) Change the output to be application/json. Are the keys still repeated? Is this valid JSON?
