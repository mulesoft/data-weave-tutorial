%dw 2.0
output json
var action = if (payload.price < 100)
                "buy"
              else if (payload.price > 140)
                "sell"
              else
                "hold"
---
{
  price  : payload.price,
  action : action
}
