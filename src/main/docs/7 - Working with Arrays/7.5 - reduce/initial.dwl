%dw 2.0
output application/json
---
{(payload[0].name): "Test while developing"} ++ { owner: "engineering"}
