%dw 2.0
output json
---
payload
    filterObject ((value, key, index) -> !((key as String) contains "secret") and value != false)
