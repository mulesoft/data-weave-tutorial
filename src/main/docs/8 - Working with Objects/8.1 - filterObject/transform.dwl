%dw 2.0
output json
---
payload filterObject (value, key, index) -> value contains "Jerry"
