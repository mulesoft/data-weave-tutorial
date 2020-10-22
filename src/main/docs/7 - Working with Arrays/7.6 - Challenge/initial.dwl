%dw 2.0
output json
var weekdays = [
  "mon",
  "tue",
  "wed",
  "thu",
  "fri",
  "sat",
  "sun"
]
// dayOfWeek is a value from 1 to 7
fun toWeekDay(date : String) : String = weekdays[(date as LocalDateTime).dayOfWeek - 1]
---
toWeekDay("2020-10-01T22:00:00")
