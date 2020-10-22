# 1.3 - Script Anatomy

Let’s go over the anatomy of a DataWeave script using the code from the last example:

---
#### DW Script:
```dw
%dw 2.0
input payload json
output csv header=false
---
payload
```
---

Notice in the script that there are three lines, a line with three dashes, then one more line. The first three lines of the script contain *directives*. The first directive, which is in every DataWeave file, defines which version the script is using. You can think of this more as a necessary formality, as other factors will determine which DataWeave version is used to run your script (e.g., the Mule Runtime).

> If you’re using DW 1, you will always use %dw 1.0. If you’re using DW 2, you will always use %dw 2.0.

The second and third lines contain the input and output directives. They each have their own form, which allows naming the inputs and defining reader and writer properties:

`input <var_name> <mime_type> [<reader_properties>]`

`output <mime_type> [<writer_properties>]`

After the first three lines of the script there is a line only containing three dashes. This is to separate your declarations from your script output logic, sometimes called the header and the body of the script respectively. You’ll see in later tutorials that you can do more than just specify input and output directives in the declarations section, you can also declare functions and variables that you can reuse in your script.

Finally, the last line of the script is the output section. Whatever the output section evaluates to is what gets sent to the writer, and is ultimately serialized into the specified output format.

> The input directive is not required in some scenarios when the DataWeave execution itself is contextualized and the input derived from said context. For example, in [Mule](github.com/mulesoft/mule) their event concept provides the context, adding inputs such as `payload` and `vars`, with their respective MIME type information.
After this section, we will avoid the input directive and assume a single input named `payload` throughout the rest of the tutorial.

## Exercise

Modify the output so that the JSON is transformed into a YAML instead of CSV.
