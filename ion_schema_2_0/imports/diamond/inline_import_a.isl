$ion_schema_2_0

/*
Import dependency graph (higher node imports lower node)
        (A)
       /   \
     (B)   (C)
       \   /
        (D)
*/
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
  isl_for_isl_can_validate: false,
  invalid_types: [
    { type: b_type, },
    { type: c_type, },
    { type: d_type, },
  ]
}

$test::{
  description: "it should still be possible to directly import a type that is transitively imported",
  valid_schemas: [
    (
      $ion_schema_2_0
      type::{
        name: bcd,
        ordered_elements: [
          { id: "imports/diamond/header_import_b.isl", type: b_type },
          { id: "imports/diamond/header_import_c.isl", type: c_type },
          { id: "imports/diamond/header_import_d.isl", type: d_type },
        ]
      }
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports: [
          { id: "imports/diamond/header_import_d.isl" },
        ]
      }
      type::{
        name: bcd,
        ordered_elements: [
          { id: "imports/diamond/header_import_b.isl", type: b_type },
          { id: "imports/diamond/header_import_c.isl", type: c_type },
          d_type,
        ]
      }
      schema_footer::{}
    )
  ]
}
