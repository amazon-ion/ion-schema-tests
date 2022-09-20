$ion_schema_1_0
type::{
  name: timestamp_precision_range_month_second,
  timestamp_precision: range::[month, second]
}
$test::{
  type: timestamp_precision_range_month_second,
  should_accept_as_valid: [
    2000-01T,
    2000-01-01T,
    2000-01-01T00:00Z,
    2000-01-01T00:00:00Z,
  ],
  should_reject_as_invalid: [
    2000T,
    2000-01-01T00:00:00.0Z,
  ]
}
