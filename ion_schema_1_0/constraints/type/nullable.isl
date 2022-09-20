$ion_schema_1_0
type::{
  name: type_nullable,
  type: nullable::string,
}
$test::{
  type: type_nullable,
  should_accept_as_valid: [
    null,
    null.null,
    null.string,
    "",
    "a",
  ],
  should_reject_as_invalid: [
    null.symbol,
    a,
    5,
  ]
}
