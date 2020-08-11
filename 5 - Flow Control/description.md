
# Flow Control

Flow control is used when you want to execute certain parts of your code in some situations, while not executing others. In other words, it’s a way to add logic to your scripts.

A common use case for variables is to store the result of some kind of boolean operation. Think of a boolean operation as an expression that returns some value if some criteria is met, and returns another value if the criteria is not met. The simplest boolean operations use equality, relational, and logical operators. You might be familiar with these from other languages:

| Expression  | Label  |
|---|---|
|A > B| Greater than |
|A < B|Less than|
|A >= B|Greater than or equal to|
|A <= B|Less than or equal to|
|A == B|Equal to|
|A ~= B|Similar to|
|Not A|Logical negation|
|!A|Logical negation|
|A and B|Logical and|
|A or B|Logical or|


For example, you might want to check if a number is greater than 100 so that you can inform a system whether or not to buy something. To do this, we will use the if/else expression, which is formatted like this:


```
if (<criteria_expression>) <return_if_true> else <return_if_false>
```

> There are cases in DW where parentheses are optional, but it’s important to note the criteria must be surrounded by parentheses in if/else expressions. Here’s a concrete example:


## Input:

```json
{
  "price": 120.00
}
```

## DW Script:

```dw
%dw 2.0
output application/json

var action = if (payload.price < 100) "buy" else "hold"
—--
{
  price  : payload.price,
  action : action
}
```

## Output:

```
{
  "price": 120.00,
  "action": "hold"
}
```

If you’re familiar with popular languages like Java, or C#, you’ll notice the way DataWeave implements if/else is much closer to a ternary expression that the if/else statements you see in those languages. The difference is very simple, however. DW uses if/else expressions that returns values, Java and C# us if/else statements that do not return values.

If/else expressions are chainable, meaning you can do multiple checks before you return any data. Here’s the format for how that works:

```
if (<criteria_expression1>) 
  <return_if_true> 
else if (<criteria_expression2>)
  <return_if_true> 
else
  <return_if_no_other_match>
```

You can have as many of these if/else chains as necessary. Imagine you had a third option in addition to “buy” and “hold”, “sell”. You could chain if/else expressions together to account for this additional criteria:


## Input:
```json
{
  "price": 100.00
}
```

## DW Script:

```
%dw 2.0
output application/json

var action = if (payload.price < 99) 
               "buy"
             else if (payload.price > 101)
               "sell"
             else
               "hold"
—--
{
  price  : payload.price,
  action : action
}
```

## Output:
```
{
  "price": 100.00,
  "action": "hold"
}
```


## Pattern Matching

Pattern matching is another method of flow control, but it does quite a bit more under the hood than the if/else expression does, and the syntax is a little more complicated. Like the if/else expression, pattern matching also returns a single value. Here’s a simplification of how pattern matching expressions are formatted:

```
<input_expression> match {
  case <condition> -> <execute_if_condition_pass>
  case <condition> -> <execute_if_condition_pass>
  else -> <execute_if_no_condition_pass>
}
```

The easiest way to understand basic pattern matching it to show an example:


# Input:

```json
{
  "action": "buy"
}
```

# DW Script:

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

# Output:
```json
"Buy at market price"
```


