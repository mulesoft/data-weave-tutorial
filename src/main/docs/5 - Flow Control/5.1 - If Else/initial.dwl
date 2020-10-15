%dw 2.0
output application/json
var action = if (payload.price < 100) "buy" else "hold"
---
{
  price  : payload.price,
  action : action
}
