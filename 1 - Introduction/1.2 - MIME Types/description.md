# 1.2 - MIME Types

While DataWeave can handle itself when it comes to parsing and serializing data, it does need to be told what data to expect and generate. This is done by specifying MIME types for the inputs and output. MIME types specify the data format of a particular document, file, or piece of data. We use them to inform DataWeave what data format to read and write. There are many MIME types, but DataWeave only uses a subset of them that make sense for its data transformation domain. Of that subset, we will be mainly focusing on 3 sfor this tutorial:

* XML: application/xml
* JSON: application/json
* CSV: application/csv

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
input payload application/json
output application/csv header=false
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

Modify your script so that the CSV output includes the header:

---
#### Output:
```csv
firstName,lastName,age
John,Smith,45
Jane,Doe,34
```
---
