%dw 2.0
output json
---
payload map (n, idx) -> {"value" :  n + 1, "index": idx}
