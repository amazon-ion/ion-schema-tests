$ion_schema_2_0

type::{
  name: a_type,
  one_of: [
    { id: "imports/diamond/inline_import_b.isl", type: b_type },
    { id: "imports/diamond/inline_import_c.isl", type: c_type },
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

$test::{
  description: "no imported types should be available in this schema's scope",
  invalid_types: [
    { type: b_type, },
    { type: c_type, },
    { type: d_type, },
  ]
}
