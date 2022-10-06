$ion_schema_1_0
$test::{
  description: "occurs must be a positive integer or non-empty, non-negative integer range",
  invalid_types: [
    { occurs: null },
    { occurs: null.int },
    { occurs: null.symbol },
    { occurs: null.list },
    { occurs: x },
    { occurs: -1 },
    { occurs: 0 },
    { occurs: () },
    { occurs: {} },
    { occurs: [0, 1] },
    { occurs: range::[min, max] },
    { occurs: range::[1] },
    { occurs: range::[0, 1, 2] },
    { occurs: range::[0d0, 1] },
    { occurs: range::[0e0, 1] },
    { occurs: range::[0, 1d0] },
    { occurs: range::[0, 1e0] },
  ]
}

$test::{
  description: "occurs range must be a valid, satisfiable range",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { occurs: range::[1, 0] },
    { occurs: range::[exclusive::1, exclusive::2] },
  ]
}

$test::{
  description: "occurs for a field must be a positive integer or a non-empty, non-negative integer range",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { fields: { a: { occurs: 0 } } },
    { fields: { a: { occurs: range::[0, 0] } } },
    { fields: { a: { occurs: range::[1, 0] } } },
    { fields: { a: { occurs: range::[-1, 1] } } },
    { fields: { a: { occurs: range::[-2, -1] } } },
    { fields: { a: { occurs: range::[exclusive::1, exclusive::1] } } },
    { fields: { a: { occurs: range::[1, exclusive::2] } } },
    { fields: { a: { occurs: range::[exclusive::1, 2] } } },
  ]
}
