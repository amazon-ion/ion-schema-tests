$ion_schema_2_0

type::{
  name: 'utf8_byte_length: 5',
  utf8_byte_length: 5,
}

$test::{
  type: 'utf8_byte_length: 5',
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

type::{
  name: 'utf8_byte_length: range::[5, 10]',
  utf8_byte_length: range::[5, 10],
}

$test::{
  type: 'utf8_byte_length: range::[5, 10]',
  should_accept_as_valid:[
    '12345',
    "1234567890",
    "\u00A2\u20AC",
    '\u20AC\u20AC'
  ],
  should_reject_as_invalid:[
    '1234',
    "12345678901",
    '\u00A2\u00A2'
  ],
}

$test::{
  description: "utf8_byte_length may not be null.int",
  invalid_types: [
    { utf8_byte_length: null.int },
  ]
}
$test::{
  description: "utf8_byte_length must be greater than or equal to zero",
  invalid_types: [
    { utf8_byte_length: -1 },
  ]
}
$test::{
  description: "utf8_byte_length range lower bound must be greater than or equal to zero",
  invalid_types: [
    { utf8_byte_length: range::[-1, 1] },
  ]
}
$test::{
  description: "utf8_byte_length range must be a valid integer range",
  invalid_types:[
    { utf8_byte_length: range::(1 2) },
    { utf8_byte_length: range::[min, max] },
    { utf8_byte_length: range::null.list },
    { utf8_byte_length: range::[2, 1] },
    { utf8_byte_length: range::[1] },
    { utf8_byte_length: range::[1, 2, 3] },
    { utf8_byte_length: range::[1d0, 2] },
    { utf8_byte_length: range::[1, 2d0] },
    { utf8_byte_length: range::[1e0, 2] },
    { utf8_byte_length: range::[1, 2e0] },
    { utf8_byte_length: range::[exclusive::1, exclusive::2] },
  ]
}
$test::{
  description: "utf8_byte_length must be an integer or a range",
  invalid_types:[
    { utf8_byte_length: [1, 2] },
    { utf8_byte_length: (1 2) },
    { utf8_byte_length: { min: 1, max: 2} },
    { utf8_byte_length: null },
    { utf8_byte_length: min },
    { utf8_byte_length: max },
    { utf8_byte_length: "foo" },
    { utf8_byte_length: false },
    { utf8_byte_length: 2d0 },
    { utf8_byte_length: 3e0 },
    { utf8_byte_length: {{ "1" }} },
    { utf8_byte_length: {{ aGVsbG8= }} },
  ]
}
