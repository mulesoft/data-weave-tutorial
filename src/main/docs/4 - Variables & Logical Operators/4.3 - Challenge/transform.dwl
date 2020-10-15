%dw 2.0
output json

var data = {
  "name": "Max the Mule",
  "locations": [
    {
      "name": "Max’s house",
      "address": "1234 Mule Street",
      "state": "CA"
    }
  ]
}
---
[data..name, data.locations[0].address, data.locations[0].state != "CA"]
