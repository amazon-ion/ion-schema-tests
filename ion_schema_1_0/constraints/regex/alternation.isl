$ion_schema_1_0
type::{
  name: regex_alternation,
  regex: "ab|cd|ef",
}
$test::{
  type: regex_alternation,
  should_accept_as_valid: [
    "ab",
    "cd",
    "ef",
  ],
  should_reject_as_invalid: [
    "a",
    "ac",
    "ace",
    "bdf",
  ]
}
