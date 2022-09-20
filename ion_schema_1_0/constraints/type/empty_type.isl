$ion_schema_1_0
type::{       // equivalent to type::{ type: any }
  name: type_empty_type,
}
$test::{
  type: type_empty_type,
  should_accept_as_valid: [
    true,
    5,
    [],
    document::()
  ],
  should_reject_as_invalid: [
    null,
    null.int,
  ]
}
