%dw 2.0
output application/json
---
payload filter ((n, idx) -> (n mod 5) == 0)