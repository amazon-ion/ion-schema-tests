$ion_schema_1_0
type::{
  name: annotations_closed_any_annotation,
  not: { annotations: closed::[] },
}
$test::{
  type: annotations_closed_any_annotation,
  should_accept_as_valid: [
    a::5,
  ],
  should_reject_as_invalid: [
    5,
  ]
}
