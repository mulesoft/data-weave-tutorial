# 5.3 - Challenge

Pretend you’re developing a flow, and at this point in the flow you have some data that you can use to determine if the application processed the request correctly. You need to output a human-readable message to the caller informing them that everything went as expected, or there was a failure.

If everything went well, the result will contain `{"status": "ok"}`, if not the result will contain `{"status": "failed"}`. For the sake of the exercise, this will be available in a `result` variable you can edit.

Output `{"message": "Request successfully processed."}` if the status is "ok", and output `{"message": "Please try again later."}` if the status is anything else. Your solution should be able to compensate for both result types.

---
#### Result:
```json
{"status": "ok"}
```

#### Output:
```json
{"message": "Request successfully processed."}
```
---
#### Result:
```json
{"status": "failed"}
```

#### Output:
```json
{"message": "Please try again later."}
```
---

- Change the result to be something other than "ok" for the status. Does your output reflect the result changes correctly without changing any of your code?

- If you used if/else expressions, to solve this challenge, attempt the solution again using pattern matching. If you used pattern matching, attempt the solution again using if/else expressions.
