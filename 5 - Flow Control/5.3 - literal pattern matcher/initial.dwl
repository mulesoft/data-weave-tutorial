%dw 2.0
output application/json
---
payload.status match {
    case  -> 1
    case  -> 0
}