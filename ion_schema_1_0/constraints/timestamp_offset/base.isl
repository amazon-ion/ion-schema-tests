$ion_schema_1_0
type::{
  name: timestamp_offset_base,
  timestamp_offset: ["-00:00", "+00:00", "+01:00", "-01:01"],
}
$test::{
  type: timestamp_offset_base,
  should_accept_as_valid: [
    2000T,
    2000-01-01T00:00:00-00:00,   // unknown local offset
    2000-01-01T00:00:00Z,        // UTC
    2000-01-01T00:00:00+00:00,   // UTC
    2000-01-01T00:00:00+01:00,
    2000-01-01T00:00:00-01:01,
  ],
  should_reject_as_invalid: [
    2000-01-01T00:00:00-01:00,   // wrong sign
    2000-01-01T00:00:00+01:01,   // wrong sign
  ]
}
