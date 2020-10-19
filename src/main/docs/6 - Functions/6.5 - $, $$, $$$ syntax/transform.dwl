%dw 2.0
output json
---
payload filter ((n, idx) -> (n mod 5) == 0)
