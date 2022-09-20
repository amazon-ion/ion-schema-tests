$ion_schema_1_0
type::{
  name: valid_values_range_timestamp_max,
  valid_values: range::[2000-01-01T00:00Z, max],
}
$test::{
  type: valid_values_range_timestamp_max,
  should_accept_as_valid: [
    2000-01-01T00:00Z,
    9999-12-31T23:59Z,
  ],
  should_reject_as_invalid: [
    1999-12-31T23:59:59.99999999999999999999Z,
  ]
}
