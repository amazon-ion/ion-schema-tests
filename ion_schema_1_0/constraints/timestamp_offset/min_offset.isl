$ion_schema_1_0
type::{
  name: timestamp_offset_min_offset,
  timestamp_offset: ["-23:59"],
}
$test::{
  type: timestamp_offset_min_offset,
  should_accept_as_valid: [
    2000-01-01T00:00:00-23:59,
  ],
  should_reject_as_invalid: [
    2000-01-01T00:00:00-23:58,
    2000-01-01T00:00:00+23:59,
  ]
}
