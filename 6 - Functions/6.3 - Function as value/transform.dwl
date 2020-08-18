%dw 2.0
output application/json
---
filter(payload, (n, idx) -> n > 3)