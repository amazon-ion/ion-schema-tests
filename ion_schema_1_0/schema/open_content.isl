$ion_schema_1_0

// verify that open content in a schema is ignored
schema_header::{
  open: content,
}
not_a_type::{}
5
type::{
  name: short_string,
  codepoint_length: range::[1, 5],
}
hello
also_not_a_type::{}
schema_footer::{
  open: content,
}

$test::{
  type: short_string,
  should_accept_as_valid: [
    "a",
    "abcde",
  ],
  should_reject_as_invalid: [
    "",
    "abcdef",
  ],
}
