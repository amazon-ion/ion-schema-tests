$ion_schema_1_0

type::{
  name: all_of_empty_type,
  all_of: [
    {},       // equivalent to { type: any }
  ],
}

$test::{
  type: all_of_empty_type,
  should_accept_as_valid:[
    5,
  ],
  should_reject_as_invalid: [
    null,
  ]
}
