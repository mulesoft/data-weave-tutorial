%dw 2.0
output application/json

fun isOddNum(n) =
  (n mod 2) == 1
---
isOddNum(2021)