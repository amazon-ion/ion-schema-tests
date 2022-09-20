$ion_schema_1_0
type::{
  name: ordered_elements_empty_list,
  ordered_elements: [],
}
$test::{
  type: ordered_elements_empty_list,
  should_accept_as_valid: [
    [],
    (),
    document::(),
  ],
  should_reject_as_invalid: [
    [a],
    (a),
    document::(a),
  ]
}
