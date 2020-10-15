%dw 2.0
output application/json
---
{
    "descendant": payload..id,
    "multivalue": payload.*id,
    "multivalueSecondLevel": [],
    "multivalueThirdLevel": [],
    "allTheIds" : payload..*id
}
