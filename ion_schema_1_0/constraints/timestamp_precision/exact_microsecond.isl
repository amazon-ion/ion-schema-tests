$ion_schema_1_0
type::{
  name: timestamp_precision_exact_microsecond,
  timestamp_precision: microsecond,
}
$test::{
  type: timestamp_precision_exact_microsecond,
  should_accept_as_valid: [
    2000-01-01T00:00:00.000000Z,
  ],
  should_reject_as_invalid: [
    2000T,
    2000-01T,
    2000-01-01T,
    2000-01-01T00:00Z,
    2000-01-01T00:00:00Z,
    2000-01-01T00:00:00.0Z,
    2000-01-01T00:00:00.00Z,
    2000-01-01T00:00:00.000Z,
    2000-01-01T00:00:00.0000Z,
    2000-01-01T00:00:00.00000Z,
    2000-01-01T00:00:00.0000000Z,
    2000-01-01T00:00:00.00000000Z,
    2000-01-01T00:00:00.000000000Z,
  ]
}
