$ion_schema_1_0
type::{
  name: element_empty_type,
  element: {},      // equivalent to element: { type: any }
}
$test::{
  type: element_empty_type,
  should_accept_as_valid: [
    [true, hello, []],
    document::(true hello [])
  ],
  should_reject_as_invalid: [
    [null, null.int],
    document::(null null.int),
  ]
}
