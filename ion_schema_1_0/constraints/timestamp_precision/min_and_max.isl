$ion_schema_1_0
type::{
  name: timestamp_precision_min,
  timestamp_precision: range::[min, day],
}
$test::{
  type: timestamp_precision_min,
  should_accept_as_valid: [
    2000T,
    2000-01T,
    2000-01-01T,
  ],
  should_reject_as_invalid: [
    2000-01-01T00:00Z,
    2000-01-01T00:00:00Z,
  ]
}

type::{
  name: timestamp_precision_max,
  timestamp_precision: range::[day, max],
}
$test::{
  type: timestamp_precision_max,
  should_accept_as_valid: [
    2000-01-01T,
    2000-01-01T00:00Z,
    2000-01-01T00:00:00Z,
  ],
  should_reject_as_invalid: [
    2000T,
    2000-01T,
  ]
}
