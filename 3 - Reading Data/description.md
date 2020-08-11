Overview:
* Single-value selector .
* Index selector [n]
* Multi-value selector .*
* Descendants selector ..

In the previous tutorial, we reviewed how you can create data using Strings, Number, Arrays, and Objects. Creating data is only half of DataWeave, however; reading data is just as important, and the features available to do so are just as robust. With these selectors you can navigate any combination of Objects and Arrays to get to the data you need. You can also think of selectors as a way to query your data.

The two most basic selectors are the single-value selector, and the index selector. The single-value selector allows you to lookup Object values by their key. Here’s an example:

---
##Input:
```json
{
  "name": "Ana",
  "age": 29
}
```
##DW Script:
```dw
%dw 2.0
output application/json
—--
payload.age
```
##Output:
```json
29
```
---

If you’re dealing with a series of nested Objects, you can string together single-value selectors to get to the value you need:

---
##Input:
```json
{
  "environment": {
    "stage": "prod"
  },
  "host": "linux"
}
```
##DW Script:
```dw
%dw 2.0
output application/json
—--
payload.environment.stage
```
##Output:
```json
"prod"
```
---

You can also use the single-value selector with square brackets instead of a period. This allows you to do useful things like use a key that references a value stored in a variable:

---
##Input:
```json
{
  "environment": {
    "stage": "prod"
  }
}
```
##DW Script:
```dw
%dw 2.0
output application/json

var firstKey = "environment"
—--
payload[firstKey].stage
```
##Output:
```json
"prod"
```
---

Now that we understand how to traverse Objects with the single-value selector, let’s see how to traverse Arrays with the index selector. Use the index selector to get to a value in an Array based on its position from the beginning of the Array:

---
##Input:
```json
["prod", "qa", "dev"]
```
##DW Script:
```dw
%dw 2.0
output application/json
—--
payload[1]
```
##Output:
```json
"qa"
```
---

Notice that by using 1 as the index, the script returned the second item in the Array. This is because Arrays in DataWeave are zero-indexed; the item in the first position of the Array has an index of 0, the second has an index of 1, and so on.

Just like Objects can be nested, so can Arrays, and you can retrieve nested Array items in the same way you do with the single-value selector, by stringing together index selectors:

---
##Input:
```json
["prod", ["qa", "dev"]]
```
##DW Script:
```dw
%dw 2.0
output application/json
—--
payload[1][1]
```
##Output:
```json
"dev"
```
---

While still on the topic of the index selector, there’s an important feature that should be noted. If you use positive numbers for the index, DataWeave will start selecting from the beginning of the Array, but if you use a negative number for the index, DataWeave will start selecting from the end of the Array. Since 0 is already reserved as the first element in the Array, and there is no such thing as -0, DataWeave starts indexing the last item of the Array from -1:

---
##Input:
```json
["prod", "qa", "dev"]
```
##DW Script:
```dw
%dw 2.0
output application/json
—--
payload[-1]
```
##Output:
```json
"dev"
```
---

If you need multiple sequential values from an Array, DataWeave allows you to select a range of values with the range selector. Instead of returning a single value like the index selector does, it will return an Array of values:

---
##Input:
```json
["prod", "qa", "dev"]
```

##DW Script:
```dw
%dw 2.0
output application/json
—--
payload[0 to 1]
```
##Output:
```json
["prod", "qa"]
```
---

* (Ch) Try to modify the script above to use only negative indexes.
* (Ch) Can you modify the script above so that it returns the input Array in reverse order?

There are two more commonly-used selectors that are important to learn: the multi-value selector, and the descendants selector. The multi-value selector returns an Array containing any value that matches the key. The values returned are dependent on the key that’s passed in. The multi-value selector works on both Arrays and Objects, but in different ways. Let’s check out Arrays first:

---
##Input:
```json
[
  {
    "number": 1,
    "number": 2
  },
  {
    "number": 3,
    "number": 4
  },
  {
    "number": 5,
    "number": 6
  },
  {
    "string": "foo"
  }
]
```
##DW Script:
```dw
%dw 2.0
output application/json
—--
payload.*number
```
##Output:
```json
[1, 2, 3, 4, 5, 6]
```
---

In this case, the multi-value selector will go through each item in the Array and apply the key as if it were a single-value selector. It’s like DW is evaluating payload[0].number, then payload[1].number, etc., and collecting those values into an Array.

Let’s see how the multi-value selector works on Objects:

---
##Input:
```json
{
  "number": 1,
  "number": 2,
  "number": 3,
  "string": 4
}
```
##DW Script:
```dw
%dw 2.0
output application/json
—--
payload.*number
```
##Output:
```json
[1, 2, 3]
```
---

* (Ch) Try using a single-value selector in the code above. What happens? Does it return the first occurrence, or last?

The multi-value selector works on Objects by getting the value for every key that matches. This works great when you’re dealing with data with repeating keys. This might seem a little weird for JSON, but consider a similar example in XML, you will see why the multi-value selector is a very important selector to know:

---
##Input:
```xml
<data>
  <number>1</number>
  <number>2</number>
  <number>3</number>
  <string>Hello</string>
</data>
```
##DW Script:
```dw
%dw 2.0
output application/json
—--
payload.data.*number
```
##Output:
```json
["1", "2", "3"]
```
---

The last selector we’ll cover in this tutorial is the descendants selector. The descendants selector is the perfect tool to use when you need the values for a certain key no matter where they appear in a piece of data. Here’s an example:

---
##Input:
```json
{
  "target": {"hello": "world"},
  "data": [
    {
      "target": "foo",
      "more": {
        "target": "bar"
      }
    }
  ]
}
```
##DW Script:
```dw
%dw 2.0
output application/json
—--
payload..target
```
##Output:
```json
[{"hello": "world"}, "foo", "bar"]
```
---
