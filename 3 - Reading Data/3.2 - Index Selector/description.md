# Index Selector

Now that we understand how to traverse Objects with the single-value selector, let’s see how to traverse Arrays with the index selector (`[n]`). Use the index selector to get to a value in an Array based on its position from the beginning of the Array:

---
## Input:
```json
["prod", "qa", "dev"]
```
## DW Script:
```dw
%dw 2.0
output application/json
—--
payload[1]
```
## Output:
```json
"qa"
```
---

Notice that by using 1 as the index, the script returned the second item in the Array. This is because Arrays in DataWeave are zero-indexed; the item in the first position of the Array has an index of 0, the second has an index of 1, and so on.

Just like Objects can be nested, so can Arrays, and you can retrieve nested Array items in the same way you do with the single-value selector, by stringing together index selectors.

There’s another important feature that should be noted. If you use positive numbers for the index, DataWeave will start selecting from the beginning of the Array, but if you use a negative number for the index, DataWeave will start selecting from the end of the Array. Since 0 is already reserved as the first element in the Array, and there is no such thing as -0, DataWeave starts indexing the last item of the Array from -1.

Given the following input, get to `"qa"` using only negative indexes.

---
## Input:
```json
["prod", ["qa", "dev"]]
```
---
