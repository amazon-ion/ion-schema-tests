$ion_schema_1_0
type::{
  name: utf8_byte_length_exact,
  utf8_byte_length: 5,
}
$test::{
  type: utf8_byte_length_exact,
  should_accept_as_valid: [
    '12345',
    "12345",
    '\u00A2\u20AC'
  ],
  should_reject_as_invalid: [
    '1234',
    '123456',
    '\u00A2\u00A2',
    '\u20AC\u20AC'
  ]
}
