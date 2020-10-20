%dw 2.0
output json
---
payload map (n, idx) -> n + 1
