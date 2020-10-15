# 5.1 - If Else

If/else expressions allow you to make decisions using logical operators and branch as a result.

```
if (<criteria_expression>) <return_if_true> else <return_if_false>
```

> There are cases in DW where parentheses are optional, but it’s important to note the criteria must be surrounded by parentheses in if/else expressions.

Here’s a concrete example:

----
#### Input:
```json
{
  "price": 120.00
}
```
#### DW Script:
```dw
%dw 2.0
output json
var action = if (payload.price < 100) "buy" else "hold"
—--
{
  price  : payload.price,
  action : action
}
```
#### Output:
```
{
  "price": 120.00,
  "action": "hold"
}
```
----

If you’re familiar with popular languages like Java, or C#, you’ll notice the way DataWeave implements if/else is much closer to a ternary expression that the if/else statements you see in those languages. The difference is very simple, however. DW uses if/else expressions that returns values, Java and C# us if/else statements that do not return values.

If/else expressions can be chained together, meaning you can do multiple checks before you return any data. Here’s the format for how that works:

```
if (<criteria_expression1>)
  <return_if_true>
else if (<criteria_expression2>)
  <return_if_true>
else
  <return_if_no_other_match>
```

You can have as many of these if/else chains as necessary.

Imagine you had a third option in addition to “buy” and “hold”, “sell”. You could chain if/else expressions together to account for this additional criteria:

## Exercise

Include a new "sell" action for our example when the price exceeds `140`.

----
#### Input:
```json
{
  "price": 150.00
}
```
----
