%dw 2.0
output json
---
payload filter ($.name startsWith  "C")
