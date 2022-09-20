$ion_schema_1_0
$test::{
  type: $sexp,
  should_accept_as_valid: [
    (),
    (1 2 3),
    null.sexp,
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.symbol,
    "hello",
  ]
}
