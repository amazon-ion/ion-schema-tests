$ion_schema_2_0

type::{
  name: 'byte_length: 5',
  byte_length: 5,
}

$test::{
  type: 'byte_length: 5',
  should_accept_as_valid: [
    {{"12345"}},
    {{ aGVsbG8= }},
  ],
  should_reject_as_invalid: [
    null,
    null.blob,
    null.clob,
    {{ aGVs }},
    {{ aGVsbG89dy4= }},
    {{ "" }},
    {{"1234"}},
    {{"123456"}},
    "abcde",
  ]
}

type::{
  name: 'byte_length: range::[5, 10]',
  byte_length: range::[5, 10],
}

$test::{
  type: 'byte_length: range::[5, 10]',
  should_accept_as_valid:[
    {{"12345"}},
    {{"1234567890"}},
    {{ aGVsbG8= }},
    {{ aGVsbG89dy4VGg== }},
  ],
  should_reject_as_invalid:[
    null,
    null.blob,
    null.clob,
    {{ aGVsbg== }},
    {{ aGVsbG89dydhfV4= }},
    {{ "" }},
    {{"1234"}},
    {{"1234567890a"}},
    "abcdef",
  ],
}

$test::{
  description: "byte_length may not be null.int",
  invalid_types: [
    { byte_length: null.int },
  ]
}
$test::{
  description: "byte_length must be greater than or equal to zero",
  invalid_types: [
    { byte_length: -1 },
  ]
}
$test::{
  description: "byte_length range lower bound must be greater than or equal to zero",
  invalid_types: [
    { byte_length: range::[-1, 1] },
  ]
}
$test::{
  description: "byte_length range must be a valid integer range",
  invalid_types:[
    { byte_length: range::(1 2) },
    { byte_length: range::[min, max] },
    { byte_length: range::null.list },
    { byte_length: range::[1] },
    { byte_length: range::[1, 2, 3] },
    { byte_length: range::[1d0, 2] },
    { byte_length: range::[1, 2d0] },
    { byte_length: range::[1e0, 2] },
    { byte_length: range::[1, 2e0] },
  ]
}

$test::{
  description: "byte_length range must not be non-empty",
  isl_for_isl_can_validate: false,
  invalid_types:[
    { byte_length: range::[2, 1] },
    { byte_length: range::[exclusive::1, exclusive::2] },
  ]
}

$test::{
  description: "byte_length must be an integer or a range",
  invalid_types:[
    { byte_length: [1, 2] },
    { byte_length: (1 2) },
    { byte_length: { min: 1, max: 2} },
    { byte_length: null },
    { byte_length: min },
    { byte_length: max },
    { byte_length: "foo" },
    { byte_length: false },
    { byte_length: 2d0 },
    { byte_length: 3e0 },
    { byte_length: {{ "1" }} },
    { byte_length: {{ aGVsbG8= }} },
  ]
}
