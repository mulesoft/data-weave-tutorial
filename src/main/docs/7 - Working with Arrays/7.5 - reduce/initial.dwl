%dw 2.0
output json
---
{(payload[0].name): "Test while developing"} ++ { owner: "engineering"}
