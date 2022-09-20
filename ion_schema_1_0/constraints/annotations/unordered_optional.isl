$ion_schema_1_0
type::{
  name: annotations_unordered_optional,
  annotations: [a, b, c, d],
}
$test::{
  type: annotations_unordered_optional,
  should_accept_as_valid: [
    5,
    a::5,
    b::5,
    c::5,
    d::5,
    a::b::c::d::5,
    d::c::b::a::5,
    open_content::a::open_content::b::open_content::c::open_content::d::open_content::5,
  ],
  should_reject_as_invalid: [
    // Note that this is interpreted by the test runner as a document rather than a sexp that is annotated with document.
    document::(
      foo
      bar
      baz
    )
  ]
}
