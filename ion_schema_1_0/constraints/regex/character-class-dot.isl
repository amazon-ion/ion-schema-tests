$ion_schema_1_0
type::{
  name: regex_character_class_dot,
  regex: "[.]",
}
$test::{
  type: regex_character_class_dot,
  should_accept_as_valid: [
    '.',
    ".",
  ],
  should_reject_as_invalid: [
    'a',
    "a",
  ]
}
