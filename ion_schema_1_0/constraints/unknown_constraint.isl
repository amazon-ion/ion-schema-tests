$ion_schema_1_0
// system should ignore unknown constraints
type::{
  name: type_with_unknown_constraint,
  unknown_constraint: null,
}
$test::{
  type: type_with_unknown_constraint,
  should_accept_as_valid: [
    5,
  ]
}
