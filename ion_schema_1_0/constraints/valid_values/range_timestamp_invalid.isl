$ion_schema_1_0
$test::{
  description: "valid_values timestamp ranges must be valid ranges with a known local offset",
  invalid_types: [
    { valid_values: range::[min, 2001T] },
    { valid_values: range::[exclusive::min, 2001T] },
    { valid_values: range::[2000T, max] },
    { valid_values: range::[2000T, exclusive::max] },
    { valid_values: range::[2000-01-01T00:00:00.000000001Z, 2000-01-01T00:00:00.000000000Z] },
    { valid_values: range::[exclusive::2000-01-01T00:00:00.000000000Z, 2000-01-01T00:00:00.000000000Z] },
    { valid_values: range::[2000-01-01T00:00:00.000000000Z, exclusive::2000-01-01T00:00:00.000000000Z] },
  ]
}
