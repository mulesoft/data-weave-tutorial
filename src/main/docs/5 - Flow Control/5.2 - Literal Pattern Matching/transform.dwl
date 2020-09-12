%dw 2.0
output application/json
---
payload.status match {
    case "Active" -> 1
    case "Disabled" -> 0
}
