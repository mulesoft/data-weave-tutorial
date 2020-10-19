%dw 2.0
output json

fun isOddNum(n) =
  (n mod 2) == 1
---
isOddNum(payload.value)
