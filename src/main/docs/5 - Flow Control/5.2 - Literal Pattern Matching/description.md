# 5.2 - Pattern Matching with Literal Values

Pattern matching is another method of flow control, but it does quite a bit more under the hood than the if/else expression does, and the syntax is a little more complicated. Like the if/else expression, pattern matching also returns a single value. Here’s a simplification of how pattern matching expressions are formatted:

```
<input_expression> match {
  case <condition> -> <execute_if_condition_pass>
  case <condition> -> <execute_if_condition_pass>
  else -> <execute_if_no_condition_pass>
}
```

The easiest way to understand basic pattern matching it to show an example:

----
#### Input:
```json
{
  "action": "buy"
}
```
#### DW Script:
```dw
%dw 2.0
output application/json
—--
payload.action match {
  case "buy"  -> “Buy at market price"
  case "sell" -> "Sell at market price"
  case "hold" -> “Hold asset"
  else   -> "Invalid input"
}
```
#### Output:
```json
"Buy at market price"
```
----

## Exercise

Use pattern matching to return `"Light off"` when the status for the input below is `0` or `"Light on"` when the status is `1`.

----
#### Input:
```json
{
  "id": 290505,
  "status": 0,
  "name": "Cabin outdoor light"
}
```
----
