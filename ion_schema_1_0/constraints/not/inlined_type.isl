$ion_schema_1_0
type::{
  name: not_inlined_type,
  not: { codepoint_length: 3 },
}
$test::{
  type: not_inlined_type,
  should_accept_as_valid: [
    '',
    a,
    ab,
    abcd,
    "",
    "a",
    "ab",
    "abcd",
  ],
  should_reject_as_invalid: [
    abc,
    "abc",
  ]
}
