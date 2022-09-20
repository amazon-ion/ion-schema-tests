$ion_schema_1_0
type::{
  name: byte_length_range,
  byte_length: range::[5, 10],
}
$test::{
  type: byte_length_range,
  should_accept_as_valid: [
    {{"12345"}},
    {{"1234567890"}},
  ],
  should_reject_as_invalid: [
    null,
    null.bool,
    null.null,
    null.blob,
    null.clob,
    {{}},
    {{"1234"}},
    {{"12345678901"}},
  ]
}
