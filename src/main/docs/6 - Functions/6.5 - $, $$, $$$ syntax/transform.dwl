%dw 2.0
output json
---
payload filter ((n, idx) -> n.name startsWith  "C")
