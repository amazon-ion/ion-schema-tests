$ion_schema_1_0
type::{
  name: any_of_inlined_types,
  any_of: [
    { codepoint_length: 3 },
    { codepoint_length: range::[2, 4] },
    { codepoint_length: 5 },
  ],
}
$test::{
  type: any_of_inlined_types,
  should_accept_as_valid: [
    ab,
    abc,
    abcd,
    abcde,
    "ab",
    "abc",
    "abcd",
    "abcde",
  ],
  should_reject_as_invalid: [
    '',
    a,
    abcdef,
    "",
    "a",
    "abcdef",
  ]
}
