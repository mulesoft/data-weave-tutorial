%dw 2.0
output json
---
{
  tickets: payload.order.*product.name,
  deliverTo: {
    address: payload.order.buyer.address,
    city: payload.order.buyer.city
  }
}