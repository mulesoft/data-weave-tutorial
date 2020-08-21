%dw 2.0
output application/json
---
{
    "descendant": payload..id,
    "multivalue": payload.*id,
    "multivalueSecondLevel": payload.secondLevel.*id,
    "allTheIds" : payload..*id
}