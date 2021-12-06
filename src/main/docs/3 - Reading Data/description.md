# 3 - Reading Data

In the previous tutorial, we reviewed how you can create data using Strings, Numbers, Booleans, Arrays, and Objects. Creating data is only half of DataWeave, however; reading data is just as important, and the features available to do so are just as robust.

DataWeave [selectors](https://docs.mulesoft.com/dataweave/latest/dataweave-selectors) allow navigating any combination of Objects and Arrays to get to the data you need. Throughout this tutorial we will review some of the most important ones:

* Single-value selector: `.`
* Index selector: `[n]`
* Range selector: `[n to m]`
* Multi-value selector: `.*`
* Descendants selector: `..`

You can also think of selectors as a way to query your data.
