$ion_schema_1_0
type::{
  name: regex_predefined_character_class_non_word,
  regex: "\\W",
}
$test::{
  type: regex_predefined_character_class_non_word,
  should_accept_as_valid: [
    "/",
    ":",
    "@",
    "[",
    "`",
    "{",
  ],
  should_reject_as_invalid: [
    "a",
    "A",
    "z",
    "Z",
    "0",
    "9",
  ]
}
