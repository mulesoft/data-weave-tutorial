%dw 2.0
output json
var secondLevel = payload.secondLevel
---
{
    "descendant": payload..id,
    "multivalue": payload.*id,
    "multivalueSecondLevel": secondLevel.*id,
    "multivalueThirdLevel": secondLevel.thirdLevel.*id,
    "allTheIds" : payload..*id
}
