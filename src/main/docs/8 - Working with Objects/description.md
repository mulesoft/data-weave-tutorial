# 8 - Working with Objects

On this final tutorial we will cover the most common DataWeave functions and operators you will need to work with Objects. It's important to note that, given the nature of Objects, *keys and values* will take center stage now instead of the simple values we've gotten used to with Arrays.

We will start with a brief review of `filterObject`, used to remove key-value pairs from an Object based on some criteria much like `filter` is used in Arrays.

We’ll then discuss `mapObject`, which is used to transform every key-value pair into something else.

We’ll also go over `pluck`, a function that goes from Objects to Arrays and is very useful when combined with the `groupBy` function we learned on the previous tutorial.

Finally, we'll review the `update` operator, the best tool to change field values in an Object, even multiple ones and conditionally. 
