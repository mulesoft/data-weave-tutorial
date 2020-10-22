%dw 2.0
output json
var result = {"status" : "ok"}
---
if (result.status == "ok")
    {"message": "Request successfully processed."}
else
    {"message": "Please try again later."}
