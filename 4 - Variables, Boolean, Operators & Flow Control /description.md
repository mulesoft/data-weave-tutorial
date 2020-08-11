
# Variables


Like other languages, DataWeave has variables so that you can store values to use later on in your script. Think of variables as a container for your data. The name you give to the variable is just like putting a label on the outside of the container so you can easily find it later. Variables are useful for giving values names, and storing a calculation that would otherwise need to be repeated. To set a variable, use the following syntax:

```dw
var <var_name> = <expression>
```

An expression is something that returns a value, or is a value itself. Here’s an example of setting a variable to an explicit value:

```dw
var name = "Max the Mule"
```

In order to reference the variable just use the name of the variable

```dw
var name = "Max the Mule"
output application/json
---
name
```

This script will output

```json
"Max the Mule"
```

Variables are almost always declared in the header of the script, where you set other declarations. 



