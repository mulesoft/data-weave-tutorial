# 3.6 - Challenge

Use what you know about selectors to get the output specified below from this input data.

---
#### Input:
```json
{
  "id": 1,
  "id": 11,
  "secondLevel": {
    "id": 2,
    "id": 22,
    "thirdLevel": {
      "id": 3,
      "id": 33
    }
  }
}
```
#### Output:
```json
{
  "descendant": [
    1,
    2,
    3
  ],
  "multivalue": [
    1,
    11
  ],
  "multivalueSecondLevel": [
    2,
    22
  ],
  "multivalueThirdLevel": [
    3,
    33
  ],
  "allTheIds": [
    1,
    11,
    2,
    22,
    3,
    33
  ]
}
```
