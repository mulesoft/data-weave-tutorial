# 7.4 - The groupBy Function

This function is useful for grouping together items in an array based on some value that is generated from each item in the array. Here’s the function signature:
```
groupBy(Array<T>, ((T, Number) -> R)): Object<(R), Array<T>>
```
`groupBy` is different from the other functions we’ve covered in this tutorial because `groupBy` does not return an `Array`, it returns an `Object`. When we define `Object` types, we can use two type parameters:
```
Object<(R), Array<T>>
```
The first type parameter is the type of the keys, and the second type parameter is the type of the values. Applying this to `groupBy`, we can see it returns an `Object` whose keys are the type of the values returned from the lambda, and the values are the type of the input `Array`.

> This isn’t exactly true. No matter what type is used to create `Object` keys, they are always coerced to type `Key`. Even if the lambda in `groupBy` returned a `Number`, the keys of the output `Object` would ultimately be of type `Key`.

The lambda passed to `groupBy` takes in an item from the input array, and the index of that item. It returns a value which is used to determine the group to which the item belongs.

This function can be used to split an array based on some field value but it can also be used to split it based on some kind of validation criteria. For example, you could split up odds and evens in an inbound array:

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
payload groupBy (n, idx) -> isEven(n)
```
#### Output
```
{
  "false": [
    1,3,5,7,9
  ],
  "true": [
    2,4,6,8,10
  ]
}
```
---

## Exercise

Group these calendar events based on the day of the week:

---
#### Input
```
[
  {
    "datetime": "2020-01-01T08:00:00",
    "dayOfWeek": "wed",
    "event": "Breakfast @ Cafe"
  },
  {
    "datetime": "2020-01-01T18:00:00",
    "dayOfWeek": "wed",
    "event": "Study for cert exam"
  },
  {
    "datetime": "2020-01-04T16:00:00",
    "dayOfWeek": "sat",
    "event": "Drinks w/ friends"
  },
  {
    "datetime": "2020-01-08T08:00:00",
    "dayOfWeek": "wed",
    "event": "Develop mule application"
  },
  {
    "datetime": "2020-01-05T08:00:00",
    "dayOfWeek": "sun",
    "event": "Football game"
  }
]
```
---
