$ion_schema_1_0
type::{
  name: codepoint_length_range,
  codepoint_length: range::[5, 10],
}
$test::{
  type: codepoint_length_range,
  should_accept_as_valid: [
    '12345',
    "1234567890",
  ],
  should_reject_as_invalid: [
    '1234',
    "12345678901",
  ]
}
