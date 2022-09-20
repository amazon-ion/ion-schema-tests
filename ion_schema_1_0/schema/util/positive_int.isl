$ion_schema_1_0
schema_header::{}
type::{
  name: positive_int,
  type: int,
  valid_values: range::[1, max]
}
schema_footer::{}

$test::{
  type: positive_int,
  should_accept_as_valid: [
    3,
    100,
  ],
  should_reject_as_invalid: [
    0,
    -1,
    0.5,
    hello,
  ],
}
