%dw 2.0
output json
---
payload mapObject (value, key, index) ->
  if (key ~= "age")
    {
        (key): value + 1
    }
  else
    {
        (key): value
    }
