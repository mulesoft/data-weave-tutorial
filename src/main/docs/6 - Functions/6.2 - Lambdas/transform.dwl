%dw 2.0
output json
---
((n) -> (n mod 2) == 1)(payload.value)
