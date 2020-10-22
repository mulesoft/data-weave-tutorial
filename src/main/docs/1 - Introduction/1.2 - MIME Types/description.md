# 1.2 - MIME Types

While DataWeave can handle itself when it comes to parsing and serializing data, it does need to be told what data to expect and generate. This is done by specifying MIME types for the inputs and output. MIME types specify the data format of a particular document, file, or piece of data. We use them to inform DataWeave what data format to read and write. There are many MIME types, but DataWeave only uses a [subset](https://docs.mulesoft.com/mule-runtime/latest/dataweave-formats) of them that make sense for its data transformation domain. Of that subset, we will be mainly focusing on 3 for this tutorial:

| Name | MIME Type        | ID     |
| :--: |:----------------:| :-----:|
| XML  | application/xml  | `xml`  |
| JSON | application/json | `json` |
| CSV  | application/csv  | `csv`  |

> Since DataWeave 2.3, MIME types can be specified with simple IDs such as `json` or `xml`. We will work with this syntax throughout this tutorial.

Here’s an example which takes in an array of JSON objects and transforms it into a CSV without a header.

---
#### Input
```json
[
  {
      "firstName": "John",
      "lastName": "Smith",
      "age": 45
  },
  {
      "firstName": "Jane",
      "lastName": "Doe",
      "age": 34
  }
]
```

#### DW Script:
```dw
%dw 2.0
input payload json
output csv header=false
---
payload
```
#### Output:
```csv
John,Smith,45
Jane,Doe,34
```
---

## Exercise

Modify your script so that the CSV output includes the header. Here's what it should look like:

---
#### Output:
```csv
firstName,lastName,age
John,Smith,45
Jane,Doe,34
```
---
