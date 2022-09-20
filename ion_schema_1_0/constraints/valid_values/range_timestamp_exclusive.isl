$ion_schema_1_0
type::{
  name: valid_values_range_timestamp_exclusive,
  valid_values: range::[exclusive::2000-01-01T00:00Z, exclusive::2001-01-01T00:00Z],
}
$test::{
  type: valid_values_range_timestamp_exclusive,
  should_accept_as_valid: [
    2000-01-01T00:00:00.00000000000000000001Z,
    2000-12-31T23:59:59.99999999999999999999Z,
  ],
  should_reject_as_invalid: [
    2000-01-01T00:00Z,
    2000-01-01T00:00:00.00000000000000000000Z,
    1999-12-31T23:00-01:00,

    2001-01-01T00:00Z,
    2001-01-01T00:00:00.00000000000000000000Z,
    2001-01-01T01:00+01:00,
  ]
}
