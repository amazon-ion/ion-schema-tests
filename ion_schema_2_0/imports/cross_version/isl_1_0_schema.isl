$ion_schema_1_0

type::{
  // Default type when "type" is not specified differs between ISL 1.0 and 2.0
  name: not_struct,
  not: struct,
}

type::{
  // This type uses a constraint that is not available after Ion Schema 1.0
  name: decimal_with_scale_2,
  scale: 2,
}

// These (or equivalent) tests cases should also work in any schema that imports this one.

$test::{
  type: not_struct,
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
  type: decimal_with_scale_2,
  should_accept_as_valid: [
    1.23,
  ],
  should_reject_as_invalid: [
    1.2,
    1.234,
  ],
}
