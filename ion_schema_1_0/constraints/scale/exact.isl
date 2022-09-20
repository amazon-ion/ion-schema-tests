$ion_schema_1_0
type::{
  name: scale_exact,
  scale: 2,
}
$test::{
  type: scale_exact,
  should_accept_as_valid: [
    0.42,
    4.2d-1,
    42d-2,
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.decimal,
    null.symbol,
    0.4,
    0.432,
  ]
}
