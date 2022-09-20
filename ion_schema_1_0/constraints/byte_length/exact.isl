$ion_schema_1_0
type::{
  name: byte_length_exact,
  byte_length: 5,
}
$test::{
  type: byte_length_exact,
  should_accept_as_valid: [
    {{"12345"}},
    {{ aGVsbG8= }},
  ],
  should_reject_as_invalid: [
    null,
    null.bool,
    null.null,
    null.blob,
    null.clob,
    {{}},
    {{"1234"}},
    {{"123456"}},
  ]
}
