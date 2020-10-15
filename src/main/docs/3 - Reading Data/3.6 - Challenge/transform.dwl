%dw 2.0
output json
---
{
    "descendant": payload..id,
    "multivalue": payload.*id,
    "multivalueSecondLevel": payload.secondLevel.*id,
    "multivalueThirdLevel": payload.secondLevel.thirdLevel.*id,
    "allTheIds" : payload..*id
}
