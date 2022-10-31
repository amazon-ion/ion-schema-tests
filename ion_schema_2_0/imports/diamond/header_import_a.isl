$ion_schema_2_0

schema_header::{
  imports: [
    { id: "imports/diamond/header_import_b.isl" },
    { id: "imports/diamond/header_import_c.isl" },
  ]
}

type::{
  name: a_type,
  one_of: [
    b_type,
    c_type,
  ]
}

$test::{
  type: a_type,
  should_accept_as_valid: [
    d::b,
    d::c,
  ],
  should_reject_as_invalid: [
    b,
    c,
    d::a,
    a::c,
  ]
}

schema_footer::{}

$test::{
  description: "no indirectly imported types should be available in this schema's scope",
  invalid_types: [
    { type: d_type, },
  ]
}
