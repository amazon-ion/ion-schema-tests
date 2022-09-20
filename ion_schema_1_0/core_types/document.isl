$ion_schema_1_0
type::{
  name: my_document,
  type: document,
  ordered_elements: [
    bool,
    symbol,
    int,
  ],
}
$test::{
  type: my_document,
  should_accept_as_valid: [
    document::(true hello 5),
  ],
  should_reject_as_invalid: [
    null,
    null.symbol,
    [true, hello, 5],
    document::(true hello 5.0),
  ]
}

$test::{
  description: "document cannot be nullable",
  invalid_types: [
    { type: nullable::document },
    { type: nullable::{ type: document } }
  ]
}
