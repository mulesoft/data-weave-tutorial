%dw 2.0
output json
---
lower(payload[0]."First Name")
