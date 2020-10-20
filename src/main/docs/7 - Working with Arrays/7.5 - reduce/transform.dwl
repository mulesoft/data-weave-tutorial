%dw 2.0
output json
---
payload groupBy ((event, index) -> event.dayOfWeek)
