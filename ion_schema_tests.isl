$ion_schema_1_0

type::{
  name: ion_schema_test_case,
  annotations: closed::required::[$test],
  one_of: [
    {
      container_length: range::[2, 3],
      fields: {
        type: { type: symbol, occurs: required },
        should_accept_as_valid: list,
        should_reject_as_invalid: list,
      },
      content: closed,
    },
    {
      fields: {
        description: { type: string, occurs: required },
        invalid_schema: { type: sexp, occurs: required },
        isl_for_isl_can_validate: bool,
      },
      content: closed,
    },
    {
      fields: {
        description: { type: string, occurs: required },
        invalid_types: { type: list, occurs: required },
        isl_for_isl_can_validate: bool,
      },
      content: closed,
    },
  ]
}

type::{
  // Valid test case or not a test at all
  name: maybe_test_case,
  type: $any,
  one_of: [
    // All elements must be a valid test case
    ion_schema_test_case,
    // Or they must not have the `$test` annotation
    { type: $any, not: { annotations: required::[$test] } },
  ]
}

type::{
  name: ion_schema_test_file,
  // Following line is commented out because ion-schema-rust doesn't recognized document, as of ion-cli@v0.4.1
  // type: document,
  element: maybe_test_case,
}
