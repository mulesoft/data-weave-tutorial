%dw 2.0
output json
---
payload pluck (v,k,idx) -> {(k): v}
