%dw 2.0
output json
---
filter(payload, (n, idx) -> n > 3)
