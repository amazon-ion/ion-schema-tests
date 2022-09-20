$ion_schema_1_0
type::{
  name: timestamp_offset_unknown_local_offset,
  timestamp_offset: ["-00:00"],
}
$test::{
  type: timestamp_offset_unknown_local_offset,
  should_accept_as_valid: [
    2000T,
    2000-01T,
    2000-01-01T,
    2000-01-01T00:00-00:00,
    2000-01-01T00:00:00-00:00,
    2000-01-01T00:00:00.000-00:00,
  ],
  should_reject_as_invalid: [
    2000-01-01T00:00:00Z,
    2000-01-01T00:00:00+00:00,
  ]
}
