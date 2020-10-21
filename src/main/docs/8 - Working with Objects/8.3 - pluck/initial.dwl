%dw 2.0
output json
---
payload
    groupBy ((order, index) -> order.orderId)
