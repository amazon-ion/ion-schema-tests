$ion_schema_2_0

type::{
  name: codepoint_length_with_single_value,
  codepoint_length: 5,
}

$test::{
  type: codepoint_length_with_single_value,
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

type::{
  name: codepoint_length_with_range,
  codepoint_length: range::[5, 10],
}

$test::{
  type: codepoint_length_with_range,
  should_accept_as_valid:[
    '12345',
    "1234567890",
    "123456789\U00027546", // 10 codepoints; 11 code units
  ],
  should_reject_as_invalid:[
    '1234',
    "12345678901",
    "123\U00027546", // 4 codepoints; 5 code units
  ],
}

$test::{
  description: "codepoint_length may not be null.int",
  invalid_types: [
    { codepoint_length: null.int },
  ]
}
$test::{
  description: "codepoint_length must be greater than or equal to zero",
  invalid_types: [
    { codepoint_length: -1 },
  ]
}
$test::{
  description: "codepoint_length range lower bound must be greater than or equal to zero",
  invalid_types: [
    { codepoint_length: range::[-1, 1] },
  ]
}
$test::{
  description: "codepoint_length range must be a valid integer range",
  invalid_types:[
    { codepoint_length: range::(1 2) },
    { codepoint_length: range::[min, max] },
    { codepoint_length: range::null.list },
    { codepoint_length: range::[1] },
    { codepoint_length: range::[1, 2, 3] },
    { codepoint_length: range::[1d0, 2] },
    { codepoint_length: range::[1, 2d0] },
    { codepoint_length: range::[1e0, 2] },
    { codepoint_length: range::[1, 2e0] },
  ]
}

$test::{
  description: "codepoint_length range must be satisfiable",
  isl_for_isl_can_validate: false,
  invalid_types:[
    { codepoint_length: range::[2, 1] },
    { codepoint_length: range::[exclusive::1, exclusive::2] },
  ]
}

$test::{
  description: "codepoint_length must be an integer or a range",
  invalid_types:[
    { codepoint_length: [1, 2] },
    { codepoint_length: (1 2) },
    { codepoint_length: { min: 1, max: 2} },
    { codepoint_length: null },
    { codepoint_length: min },
    { codepoint_length: max },
    { codepoint_length: "foo" },
    { codepoint_length: false },
    { codepoint_length: 2d0 },
    { codepoint_length: 3e0 },
    { codepoint_length: {{ "1" }} },
    { codepoint_length: {{ aGVsbG8= }} },
  ]
}
