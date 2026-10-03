%dw 2.0
output json
var result = {"status" : "ok"}
---
if (result.status == "ok")
    {"message": "Request successfully processed."}
else
    {"message": "Please try again later."}

/* to implament the same using the literal pattern matching as asked in the challenge

%dw 2.0
output json
var result = {"status" : "ok"}
---
result.status match{
    case "ok" -> {"message": "Request successfully processed."}
    else -> {"message": "Please try again later."}
}
*/

