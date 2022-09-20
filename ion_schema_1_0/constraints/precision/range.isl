$ion_schema_1_0
type::{
  name: precision_range,
  precision: range::[2, 4],
}
$test::{
  type: precision_range,
  should_accept_as_valid: [
    12d2,
    123d1,
    1234d0,
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.decimal,
    null.string,
    1.,
    12345.,
  ]
}
