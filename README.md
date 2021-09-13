# DataWeave Tutorial

This repository contains the content shown in the [DataWeave Tutorial](https://developer.mulesoft.com/learn/dataweave/tutorial)

The docs are located [here](https://github.com/mulesoft-labs/data-weave-tutorial/tree/master/src/main/docs)

### The docs Folder Structure

We use **a folder for each section** of the tutorial and a couple of files to describe the content of each section.

Section folders can be nested for sub sections.

The section folder name should be `<section number> - <section name>` (e.g. `1.1 - What is DataWeave?`)

A **section** contains these files:            

| file name                   | description                          |
|-----------------------------|--------------------------------------| 
| description.md              | Explanation of the section       |
| initial.dwl                 | Initial script shown to the user |
| transform.dwl               | Script that solves the given exercise. We use this in our CI to validate the given input and outputs match |
| `out.json` / `out.xml` / etc| Expected result of the exercise  |
| answer.md                   | this will be shown to the user upon clicking a button that says "Show answer" (not yet implemented)  |

There may also be an `inputs` folder, listing the files for input values the script should include. The name of the file will determine the name of the input value: `payload.json` will include a JSON `payload` input.

So, for example:
```
src/main/docs
+
+---> 1 - Introduction
      |
      +---> description.md
      |
      +---> 1.1 - What is DataWeave?
      |     |
      |     +---> description.md
      |     |
      |     +---> initial.dwl
      |     |
      |     +---> transform.dwl
      |     |
      |     +---> out.json
      |     |
      |     +---> answer.md
      |
      +---> 2 - Creating Data
      |     +
      |     |
      |     +---> ...
      |
      ...
```

Disclaimer: It is not an officially supported MuleSoft Product. It is not supported by MuleSoft Support, you won't be able to open MuleSoft Support cases for this Suite and there are no SLAs for responses nor bug/features progress.
