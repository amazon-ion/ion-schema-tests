$ion_schema_1_0
type::{
  name: utf8_byte_length_range,
  utf8_byte_length: range::[5, 10],
}
 $test::{
  type: utf8_byte_length_range,
  should_accept_as_valid: [
    '12345',
    "1234567890",
    "\u00A2\u20AC",
    '\u20AC\u20AC'
  ],
  should_reject_as_invalid: [
    '1234',
    "12345678901",
    '\u00A2\u00A2'
  ]
}
