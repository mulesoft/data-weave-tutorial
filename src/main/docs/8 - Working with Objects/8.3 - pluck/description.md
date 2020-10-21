# 8.3 - The pluck function
This is the function to use if you need to transform an Object into an Array. Here’s the function signature:

```
pluck(Object<K,V>, (V,K,Number) -> T): Array<T>
```

Just like our other functions that work on Objects, `pluck` takes as inputs an Object, and a lambda that accepts 3 parameters: a value, key, and number representing an index. This lambda can return any type. Whatever type the lambda returns is the same type for each item in the output Array.

Here’s an example of using `pluck` to take in an Object, and create an Array where each element is a single key-value pair from the input object:

---
#### Input
```json
{
  "firstName": "Avery",
  "lastName": "Chance",
  "age": 56,
  "occupation": "Physicist"
}
```
#### DW Script
```dw
%dw 2.0
output json
---
payload pluck (v,k,idx) -> {(k): v}
```
#### Output
```json
[
  {"firstName": "Avery"},
  {"lastName": "Chance"},
  {"age": 56},
  {"occupation": "Physicist"}
]
```
---

The `pluck` function is commonly used in conjunction with `groupBy`. This is because often times `groupBy` does exactly what the user wants in terms of grouping data, but the keys labelling the groups are not needed, and the user would rather have an Array of Arrays instead of an Object of Arrays.

## Exercise

 Given the input flat representation of multiple product orders and their associated line items, group the orders accordingly as exemplified and prepare them for processing: we want an Array of Arrays, where each internal Array contains the individual line items for a particular order. That way, we will be ready to iteratively scan the outer Array for orders and then doing the same with the line items in the inner Array.

---
#### Input
```json
[
  {
    "orderId"  : 1,
    "customer" : "Josh",
    "lineId"   : 1,
    "lineItem" : "Shoes",
    "price"    : 50
  },
  {
    "orderId"  : 1,
    "customer" : "Josh",
    "lineId"   : 2,
    "lineItem" : "Socks",
    "price"    : 20
  },
  {
    "orderId"  : 2,
    "customer" : "Mariano",
    "lineId"   : 3,
    "lineItem" : "Shirt",
    "price"    : 30
  },
  {
    "orderId"  : 2,
    "customer" : "Mariano",
    "lineId"   : 4,
    "lineItem" : "Jacket",
    "price"    : 80
  }
]
```
#### Output
```json
[
  [
    {
      "orderId": 1,
      "customer": "Josh",
      "lineId": 1,
      "lineItem": "Shoes",
      "price": 50
    },
    {
      "orderId": 1,
      "customer": "Josh",
      "lineId": 2,
      "lineItem": "Socks",
      "price": 20
    }
  ],
  [
    {
      "orderId": 2,
      "customer": "Mariano",
      "lineId": 3,
      "lineItem": "Shirt",
      "price": 30
    },
    {
      "orderId": 2,
      "customer": "Mariano",
      "lineId": 4,
      "lineItem": "Jacket",
      "price": 80
    }
  ]
]
```
---
