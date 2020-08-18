%dw 2.0
output application/json
---
((n) -> (n mod 2) == 1)(2021)