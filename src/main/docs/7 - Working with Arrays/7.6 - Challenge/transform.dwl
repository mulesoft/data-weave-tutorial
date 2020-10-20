%dw 2.0
output application/json
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
payload
    map ((event, index) -> event ++ {day : toWeekDay(event.datetime)})
    filter ((event, index) -> event.organizer == "Ross")
