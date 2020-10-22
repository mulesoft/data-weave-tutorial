# 8.4 - The update operator

This operator is the one to use when you wish to change specific fields on an Object, while keeping all others the same.

Here's an example where `update` is used to increase a value and even insert a field using the upserting functionality (`!`):

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
payload update {
  case currentAge at .age ->  currentAge + 1
  case .status! -> "Retired"
}
```
#### Output
```json
{
  "firstName": "Avery",
  "lastName": "Chance",
  "age": 57,
  "occupation": "Physicist",
  "status": "Retired"
}
```
---

Notice that you can capture the values into variables, as with `currentAge`. This is important because it allows using the value as part of the new one and even evaluating conditions. Let's see an example:

---
#### Input
```json
[
    {"name": "Ken (Leandro)", "age": 30},
    {"name": "Tomo", "age": 70},
    {"name": "Kajika", "age": 10}
]
```
#### DW Script
```dw
%dw 2.0
output json
---
payload map ((user, index) -> user  update {
        case name at .name if (name == "Tomo") -> name ++ " (Christian)"
})
```
#### Output
```json
[
  {"name": "Ken (Leandro)", "age": 30},
  {"name": "Tomo (Christian)", "age": 70},
  {"name": "Kajika", "age": 10}
]
```
---

So far we've worked with flat Objects, but the `update` operator allows selecting fields no matter how nested the Object structure is.

## Exercise

Update the user data below. Usernames should be all lower case and the street should be `"Fiskargatan"`.

----
#### Input
```json
{
  "username": "WASP",
  "name": "Lisbeth",
  "surname": "Salander",
  "location": {
      "address": {
          "street": "Lundagatan",
          "number": 9
      },
      "city": "Stockholm",
      "country": "Sweden"
  }
}
```
