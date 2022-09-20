$ion_schema_1_0
type::{
  name: valid_values_range_timestamp_min,
  valid_values: range::[min, 2000-01-01T00:00Z],
}
$test::{
  type: valid_values_range_timestamp_min,
  should_accept_as_valid: [
    0001-01-01T00:00Z,
    2000-01-01T00:00Z,
  ],
  should_reject_as_invalid: [
    2000-01-01T00:00:00.00000000000000000001Z,
  ]
}
