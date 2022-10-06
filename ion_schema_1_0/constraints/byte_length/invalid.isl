$ion_schema_1_0
$test::{
  description: "byte_length must be a non-negative integer or range",
  invalid_types: [
    { byte_length: null },
    { byte_length: null.int },
    { byte_length: null.list },
    { byte_length: x },
    { byte_length: -1 },
    { byte_length: 5.2 },
    { byte_length: [0, 5] },
    { byte_length: range::[min, max] },
    { byte_length: range::[0] },
    { byte_length: range::[0, 1, 2] },
    { byte_length: range::[0d0, 1] },
    { byte_length: range::[0e0, 1] },
    { byte_length: range::[0, 1d0] },
    { byte_length: range::[0, 1e0] },
  ]
}

$test::{
  description: "byte_length range must be a valid, satisfiable range",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { byte_length: range::[1, 0] },
  ]
}
