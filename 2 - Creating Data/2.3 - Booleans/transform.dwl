%dw 2.0
output application/json
---
{
  "string": typeOf("hello"),
  "number": typeOf(1),
  "boolean": typeOf(true)
}
