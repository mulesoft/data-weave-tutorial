%dw 2.0
output json
---
payload update {
  case uname at .username -> lower(uname)
  case .location.address.street -> "Fiskargatan"
}
