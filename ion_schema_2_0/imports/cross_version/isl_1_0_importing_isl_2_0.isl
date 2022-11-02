$ion_schema_1_0

// Tests that features not available in ISL 1.0 will work when they are part of an imported ISL 2.0 schema

schema_header::{
  imports: [
    { id: "imports/cross_version/isl_2_0_schema.isl", type: not_struct },
    { id: "imports/cross_version/isl_2_0_schema.isl", type: snake_case_annotated },
  ]
}

type::{
  name: imported_not_struct,
  type: not_struct,
}

type::{
  name: imported_snake_case_annotated,
  type: snake_case_annotated,
}

schema_footer::{}

$test::{
  type: imported_not_struct,
  should_accept_as_valid: [
    abc,
    123,
    true,
    // In Ion Schema 2.0, the default type is "$any" so all nulls should be accepted regardless of type.
    null,
    null.struct,
  ],
  should_reject_as_invalid: [
    {},
  ],
}

$test::{
  type: imported_snake_case_annotated,
  should_accept_as_valid: [
    abc_def::1,
  ],
  should_reject_as_invalid: [
    ABC_DEF::2
  ],
}
