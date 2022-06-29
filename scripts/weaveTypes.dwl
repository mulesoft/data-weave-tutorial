%dw 2.0
input payload application/json
output application/java
var children = flatten(payload..children)
---
{(
    children
        filter ((x) -> x.inputs != null)
        map ((x) -> {
            (x.path):  x.inputs mapObject do {
                var in = $$ splitBy "."
                var inputName = in[0]
                var dataformat = in[1]
                ---
                {(inputName): read($, dataformat) write "application/dw"}
            }
        })
)}