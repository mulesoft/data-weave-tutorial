%dw 2.0
output application/json
---
payload pluck (v,k,idx) -> {(k): v}