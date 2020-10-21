%dw 2.0
output json
---
payload
    map ((item, index) -> item
                            mapObject ((value, key, index) ->
                                  {(lower(key)) : upper(value)}))
