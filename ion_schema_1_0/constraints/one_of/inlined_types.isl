$ion_schema_1_0
type::{
  name: one_of_inlined_types,
  one_of: [
    { codepoint_length: 3 },
    { codepoint_length: range::[2, 4] },
    { codepoint_length: 5 },
  ],
}
$test::{
  type: one_of_inlined_types,
  should_accept_as_valid: [
    ab,
    abcd,
    abcde,
  ],
  should_reject_as_invalid: [
    "",
    abc,
    abcdef,
  ]
}
