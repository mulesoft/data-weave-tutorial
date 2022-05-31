%dw 2.0
output yaml

fun highlightTxt(text) = upper(text) ++ "!!"
---
payload
    groupBy ((item) -> item.dayOfWeek)
    mapObject ((value, key) ->
        if(key ~= "Friday")
            (key): value.event map highlightTxt($)
        else
            (key): value.event
    )