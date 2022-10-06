$ion_schema_1_0
$test::{
  description: "precision must be a positive integer or range",
  invalid_types: [
    { precision: null },
    { precision: null.int },
    { precision: null.list },
    { precision: x },
    { precision: 0 },
    { precision: 5.2 },
    { precision: [0, 5] },
    { precision: range::[min, max] },
    { precision: range::[1] },
    { precision: range::[1, 2, 3] },
    { precision: range::[0d0, 1] },
    { precision: range::[0e0, 1] },
    { precision: range::[0, 1d0] },
    { precision: range::[0, 1e0] },
  ]
}

$test::{
  description: "precision range must be a valid, satisfiable range",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { precision: range::[1, 0] },
  ]
}
