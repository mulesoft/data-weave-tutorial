%dw 2.0
output json
---
{
    "descendant": payload..id,
    "multivalue": payload.*id,
    "multivalueSecondLevel": "",
    "multivalueThirdLevel": "",
    "allTheIds" : payload..*id
}
