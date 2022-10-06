$ion_schema_1_0
$test::{
  description: "container_length must be a non-negative integer or range",
  invalid_types: [
    { container_length: null },
    { container_length: null.int },
    { container_length: null.list },
    { container_length: x },
    { container_length: -1 },
    { container_length: 5.2 },
    { container_length: [0, 5] },
    { container_length: range::[min, max] },
    { container_length: range::[1] },
    { container_length: range::[0, 1, 2] },
    { container_length: range::[0d0, 1] },
    { container_length: range::[0e0, 1] },
    { container_length: range::[0, 1d0] },
    { container_length: range::[0, 1e0] },
  ]
}

$test::{
  description: "container_length range must be a valid, satisfiable range",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { container_length: range::[1, 0] },
  ]
}
