%dw 2.0
output json
---
filter(payload, (n, idx) -> (n mod 2) == 1)
