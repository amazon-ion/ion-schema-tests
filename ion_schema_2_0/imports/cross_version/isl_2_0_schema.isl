$ion_schema_2_0

type::{
  // Default type when "type" is not specified differs between ISL 1.0 and 2.0
  name: not_struct,
  not: struct,
}

type::{
  // This is using features not available in any prior version
  name: snake_case_annotated,
  annotations: { element: { regex: "^[a-z0-9_]+$"} },
}

// These (or equivalent) tests cases should also work in any schema that imports this one.

$test::{
  type: not_struct,
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
  type: snake_case_annotated,
  should_accept_as_valid: [
    abc_def::1,
  ],
  should_reject_as_invalid: [
    ABC_DEF::2
  ],
}

