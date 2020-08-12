# The groupBy Function

The groupBy function is useful for grouping together items in an Array based on some value that is generated from each item in the Array. Here’s the function signature:
```
groupBy(Array<T>, ((T, Number) -> R)): Object<(R), Array<T>>
```
groupBy is different from the other functions we’ve covered in this tutorial because groupBy does not return an Array, it returns an Object. When we define Object types, we can use two type parameters:
```
Object<(R), Array<T>>
```
The first type parameter is the type of the keys, and the second type parameter is the type of the values. Applying this to groupBy, we can see it returns an Object whose keys are the type of the values returned from the lamda, and the values are the type of the input Array.

Note: This isn’t exactly true. No matter what type is used to create Object keys, they are always coerced to type Key. Even if the lambda in groupBy returned a Number, the keys of the output Object would ultimately be of type Key.

The lambda passed to groupBy takes in an item from the input Array, and the index of that item. It returns a value which is used to determine the group to which the item belongs. Here’s an example that groups calendar events based on day of the week:

---
### Input
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

### Dw Script
```
%dw 2.0
output application/json
---
payload groupBy (event, idx) -> event.dayOfWeek
```

### Output
```
{
  "wed": [
    {
      "datetime": "2020-01-01'T'08:00:00",
      "dayOfWeek": "wed",
      "event": "Breakfast @ Cafe"
    },
    {
      "datetime": "2020-01-01'T'18:00:00",
      "dayOfWeek": "wed",
      "event": "Study for cert exam"
    },
    {
      "datetime": "2020-01-08'T'08:00:00",
      "dayOfWeek": "wed",
      "event": "Develop mule application"
    }
  ],
  "sat": [
    {
      "datetime": "2020-01-04'T'16:00:00",
      "dayOfWeek": "sat",
      "event": "Drinks w/ friends"
    }
  ],
  "sun": [
    {
      "datetime": "2020-01-05'T'08:00:00",
      "dayOfWeek": "sun",
      "event": "Football game"
    }
  ]
}
```
---

(Ch) Modify the script above to use the "datetime" to determine the day of week instead of the "dayOfWeek" value. Hint: you will need to cast the String to a LocalDateTime and use date decomposition to accomplish this.

groupBy can also be used to split up Arrays based on some kind of validation criteria, as well. For example, you could split up odds and evens in an inbound Array:

---
### Input

[1,2,3,4,5,6,7,8,9,10]

### Dw Script

%dw 2.0
output application/json
---
payload groupBy (n, idx) -> isEven(n)

### Output

{
  "false": [
    1,3,5,7,9
  ],
  "true": [
    2,4,6,8,10
  ]
}
---

(Ch) How can you determine the number of keys the output Object from groupBy should contain?
