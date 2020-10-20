%dw 2.0
output json
---
payload reduce ((env, acc = {}) -> acc ++ {(env.name) : env.id})
