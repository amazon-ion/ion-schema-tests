$ion_schema_1_0
type::{
  name: occurs_fields_range_nullable,
  fields: { a: { type: nullable::string, occurs: range::[1, 3] } }
}
$test::{
  type: occurs_fields_range_nullable,
  should_accept_as_valid: [
    { a: null },
    { a: null, a: null },
    { a: null, a: null, a: null },
    { a: null.string },
    { a: null.string, a: null.string },
    { a: null.string, a: null.string, a: null.string },
    { a: "1" },
    { a: "1", a: "2" },
    { a: "1", a: "2", a: "3" },
  ],
  should_reject_as_invalid: [
    null,
    { },
    { a: null, a: null, a: null, a: null },
    { a: null.string, a: null.string, a: null.string, a: null.string },
    { a: "1", a: "2", a: "3", a: "4" },
  ]
}
