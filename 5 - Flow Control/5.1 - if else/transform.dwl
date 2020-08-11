%dw 2.0

var user = {name: "Peter", age: 19}
output application/json
---
if(user.age <= 5)
 "Toddler"
else if(user.age < 20)
 "Teenage"    
else
 "Sr" 