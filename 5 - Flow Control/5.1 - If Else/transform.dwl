%dw 2.0
output application/json

var user = {name: "Peter", age: 19}
---
if(user.age <= 5)
 "Toddler"
else if(user.age < 20)
 "Teenager"
else
 "Sr"
