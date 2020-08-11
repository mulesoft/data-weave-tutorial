# The pluck function
pluck is the function to use if you need to transform an Object into an Array. Here’s the function signature:

```
pluck(Object<K,V>, (V,K,Number) -> T): Array<T>
```

Just like our other functions that work on Objects, pluck takes as inputs an Object, and a lambda that accepts 3 parameters: a value, key, and number representing an index. This lambda can return any type. Whatever type the lambda returns is the same type for each item in the output Array:

```
pluck(Object<K,V>, (V,K,Number) -> T): Array<T>
```

Here’s an example of using pluck to take in an Object, and create an Array where each element is a single key:value pair from the input object:

---
### Input
```json
{
  "firstName": "Avery",
  "lastName": "Chance",
  "age": 56,
  "occupation": "Physicist"
}
```
### DW Script
```dw
%dw 2.0
output application/json
---
payload pluck (v,k,idx) -> {(k): v}
```
### Output
```json
[
  {"firstName": "Avery"},
  {"lastName": "Chance"},
  {"age": 56},
  {"occupation": "Physicist"}
]
```
---

(Ch) Modify the script above to create the following output:
```
[
  ["firstName", "Avery", 0],
  ["lastName", "Chance", 1],
  ["age", 56, 2],
  ["occupation", "Physicist", 3]
]
```
pluck is commonly used in conjunction with groupBy. This is because often times groupBy does exactly what the user wants in terms of grouping data, but the keys labeling the groups are not needed, and the user would rather have an Array of Arrays instead of an Object of Arrays. For example, maybe we have a flat representation of multiple product orders and their associated line items:

---
### Input
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

### DW Script
```dw
%dw 2.0
output application/json
---
payload groupBy (item,idx) -> item.orderId
```

### Output
```json
{
  "1": [
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
  "2": [
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
}
```
---

This is great! We’ve effectively grouped all the data into their own orders. If we need to access individual groups and deal with each line individually this is the shape of data we want. However, what if wanted to send the payload into a for-each scope and process each set of order line items individually. We can’t pass an Object to a for-each scope, and we don’t need to label the groups by orderId because each item in the group already contains the orderId. In this case we want an Array of Arrays, where each internal Array contains the individual line items for a particular order. 

(Ch) Before reading ahead, try to satisfy the use case above using groupBy and pluck.

Using pluck after groupBy accomplishes this nicely:

---
### Input
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

### DW Script
```dw
%dw 2.0
output application/json
---
payload 
  groupBy ((orderLine,idx) -> orderLine.orderId)
  pluck   ((orderLines,orderId,idx) -> orderLines)
```

### Output
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
