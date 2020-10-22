%dw 2.0
output json
var shoppingList = [
  {"orderId": "1", "lineId": "1", "product": "toothpaste"},
  {"orderId": "1", "lineId": "2", "product": "floss"},
  {"orderId": "2", "lineId": "3", "product": "toothbrush"},
  {"orderId": "2", "lineId": "4", "product": "mouth wash"},
  {"orderId": "2", "lineId": "4", "product": "mouth wash"}
]
---
shoppingList[0].product ++ " keeps your teeth healthy"
