$ion_schema_1_0

type::{
  name: all_of_inlined_types,
  all_of: [
    { codepoint_length: range::[1, 4] },
    { codepoint_length: range::[3, 4] },
    { codepoint_length: range::[3, 5] },
  ],
}

$test::{
  type: all_of_inlined_types,
  should_accept_as_valid: [
    abc,
    abcd,
    "abc",
    "abcd",
  ],
  should_reject_as_invalid: [
    '',
    a,
    ab,
    abcde,
    abcdef,
    "",
    "a",
    "ab",
    "abcde",
    "abcdef",
  ]
}
