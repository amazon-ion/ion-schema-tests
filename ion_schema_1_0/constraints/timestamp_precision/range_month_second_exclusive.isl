$ion_schema_1_0
type::{
  name: timestamp_precision_range_month_second_exclusive,
  timestamp_precision: range::[exclusive::month, exclusive::second]
}
$test::{
  type: timestamp_precision_range_month_second_exclusive,
  should_accept_as_valid: [
    2000-01-01T,
    2000-01-01T00:00Z,
  ],
  should_reject_as_invalid: [
    2000T,
    2000-01T,
    2000-01-01T00:00:00Z,
  ]
}
