%dw 2.0
output application/json
---
payload.status match {
    case 0 -> "Light off"
    case 1 -> "Light on"
}
