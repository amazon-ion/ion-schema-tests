$ion_schema_1_0
type::{
  name: codepoint_length_exact,
  codepoint_length: 5,
}
$test::{
  type: codepoint_length_exact,
  should_accept_as_valid: [
    '12345',
    "12345",
    "1234\U00027546", // 5 codepoints; 6 code units
  ],
  should_reject_as_invalid: [
    '1234',
    "123456",
    "123\U00027546", // 4 codepoints; 5 code units
  ]
}
