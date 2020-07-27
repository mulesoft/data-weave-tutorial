%dw 2.0
output application/json
---
payload filterObject (v,k,idx) -> v contains "Jerry"