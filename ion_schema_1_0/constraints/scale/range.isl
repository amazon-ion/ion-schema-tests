$ion_schema_1_0
type::{
  name: scale_range,
  scale: range::[2, 4],
}
$test::{
  type: scale_range,
  should_accept_as_valid: [
    0.42,
    0.432,
    0.4321,
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.decimal,
    null.symbol,
    0.4,
    0.43210,
  ]
}
