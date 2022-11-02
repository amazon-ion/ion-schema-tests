$ion_schema_2_0

// Tests that features not available in ISL 2.0 will work when they are part of an imported ISL 1.0 schema

schema_header::{
  imports: [
    { id: "imports/cross_version/isl_1_0_schema.isl", type: not_struct },
    { id: "imports/cross_version/isl_1_0_schema.isl", type: decimal_with_scale_2 },
  ]
}

type::{
  name: imported_not_struct,
  type: not_struct,
}

type::{
  name: imported_decimal_with_scale_2,
  type: decimal_with_scale_2,
}

schema_footer::{}

$test::{
  type: imported_not_struct,
  should_accept_as_valid: [
    abc,
    123,
    true
  ],
  should_reject_as_invalid: [
    {},
    // In Ion Schema 1.0, the default type is "any" so all nulls should be rejected regardless of type.
    null,
    null.int,
  ],
}

$test::{
  type: imported_decimal_with_scale_2,
  should_accept_as_valid: [
    1.23,
  ],
  should_reject_as_invalid: [
    1.2,
    1.234,
  ],
}
