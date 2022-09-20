$ion_schema_1_0
type::{
  name: contains_nulls,
  contains: [null, null.bool, null.int, null.string],
}
$test::{
  type: contains_nulls,
  should_accept_as_valid: [
    [null.int, null, null.bool, null.string],
    document::(null.bool null null.string null.int),
  ],
  should_reject_as_invalid: [
    null,
    null.bool,
    null.string,
    [],
    (),
    (null.int null null.string),
    document::(null.int null null.string),
  ]
}
