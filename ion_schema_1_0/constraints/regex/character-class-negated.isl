$ion_schema_1_0
type::{
  name: regex_character_class_negated,
  regex: "[^bcd]",
}
$test::{
  type: regex_character_class_negated,
  should_accept_as_valid: [
    "a",
    "e",
  ],
  should_reject_as_invalid: [
    "b",
    "c",
    "d",
  ]
}
