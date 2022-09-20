$ion_schema_1_0
type::{
  name: precision_exact,
  precision: 2,
}
$test::{
  type: precision_exact,
  should_accept_as_valid: [
    42.,
    42d0,
    42d-0,
    4.2d1,
    0.42d2,
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.decimal,
    null.string,
    4.,
    42.0,
  ]
}
