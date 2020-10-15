%dw 2.0
output json
---
if (payload.status == "ok")
    {"message": "Request successfully processed."}
else
    {"message": "Please try again later."}
