%dw 2.0
output json
---
{
  "string": typeOf("hello"),
  "number": typeOf(1),
  "boolean": typeOf(true)
}
