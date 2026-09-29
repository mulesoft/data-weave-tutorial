# 7.6 - Challenge

Use the functions you just learned and the concatenation function `++` to work with the payload below so that the missing `day` field is included in each event and only events organized by Ross are shown.

As an example, you can see how a `datetime` value is converted to a `LocalDateTime` and date decomposition used to obtain a day of the week from 1 to 7 and then mapped to the desired name.

---
#### Input
```
[
  {
    "datetime": "2020-01-01T08:00:00",
    "event": "Breakfast @ Cafe",
    "organizer": "Phoebe"
  },
  {
    "datetime": "2020-01-02T18:00:00",
    "event": "Study for cert exam",
    "organizer": "Ross"
  },
  {
    "datetime": "2020-01-04T16:00:00",
    "event": "Drinks w/ friends",
    "organizer": "Monica"
  },
  {
    "datetime": "2020-01-08T08:00:00",
    "event": "Develop mule application",
    "organizer": "Ross"
  },
  {
    "datetime": "2020-01-05T08:00:00",
    "event": "Football game",
    "organizer": "Joey"
  }
]
```
#### Output
```
[
  {
    "datetime": "2020-01-02T18:00:00",
    "event": "Study for cert exam",
    "organizer": "Ross",
    "day": "thu"
  },
  {
    "datetime": "2020-01-08T08:00:00",
    "event": "Develop mule application",
    "organizer": "Ross",
    "day": "wed"
  }
]
```
