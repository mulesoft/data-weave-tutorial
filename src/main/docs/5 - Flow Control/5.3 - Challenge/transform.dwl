%dw 2.0
output application/json
---
if (payload.status == "ok")
    {"message": "success"}
else
    {"message": "failure"}