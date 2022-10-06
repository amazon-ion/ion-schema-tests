$ion_schema_1_0
$test::{
  description: "valid_values timestamp ranges must have a known local offset",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { valid_values: range::[min, 2001T] },
    { valid_values: range::[exclusive::min, 2001T] },
    { valid_values: range::[2000T, max] },
    { valid_values: range::[2000T, exclusive::max] },
  ]
}
$test::{
  description: "valid_values timestamp ranges must be satisfiable ranges",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { valid_values: range::[2000-01-01T00:00:00.000000001Z, 2000-01-01T00:00:00.000000000Z] },
    { valid_values: range::[exclusive::2000-01-01T00:00:00.000000000Z, 2000-01-01T00:00:00.000000000Z] },
    { valid_values: range::[2000-01-01T00:00:00.000000000Z, exclusive::2000-01-01T00:00:00.000000000Z] },
  ]
}
