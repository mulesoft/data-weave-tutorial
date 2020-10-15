# 5.3 - Challenge

Pretend you’re developing a flow, and at this point in the flow you have some data that you can use to determine if the application processed the request correctly. You need to output a human-readable message to the caller informing them that everything went as expected, or there was a failure.

If everything went well, the input will contain `{"status": "ok"}`, if not the input will contain `{"status": "failed"}`.  

Output `{"message": "Request successfully processed."}` if the status is "ok", and output `{"message": "Please try again later."}` if the status is anything else. Your solution should be able to compensate for both input types.

---
#### Input:
```json
{"status": "ok"}
```

#### Output:
```json
{"message": "Request successfully processed."}
```
---

---
#### Input:
```json
{"status": "failed"}
```

#### Output:
```json
{"message": "Please try again later."}
```
---

- Change the input to be something other than "ok" for the status. Does your output reflect the input changes correctly without changing any of your code?

- If you used if/else expressions, to solve this challenge, attempt the solution again using pattern matching. If you used pattern matching, attempt the solution again using if/else expressions.
