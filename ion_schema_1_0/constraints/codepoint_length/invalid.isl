$ion_schema_1_0
$test::{
  description: "codepoint_length must be a non-negative integer or range",
  invalid_types: [
    { codepoint_length: null },
    { codepoint_length: null.int },
    { codepoint_length: null.list },
    { codepoint_length: x },
    { codepoint_length: -1 },
    { codepoint_length: 5.2 },
    { codepoint_length: [0, 5] },
    { codepoint_length: range::[min, max] },
    { codepoint_length: range::[0] },
    { codepoint_length: range::[0, 1, 2] },
    { codepoint_length: range::[0d0, 1] },
    { codepoint_length: range::[0e0, 1] },
    { codepoint_length: range::[0, 1d0] },
    { codepoint_length: range::[0, 1e0] },
  ]
}

$test::{
  description: "codepoint_length range must be a valid, satisfiable range",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { codepoint_length: range::[1, 0] },
  ]
}
