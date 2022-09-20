$ion_schema_1_0
type::{
  name: regex_predefined_character_class_word,
  regex: "\\w",
}
$test::{
  type: regex_predefined_character_class_word,
  should_accept_as_valid: [
    "a",
    "A",
    "z",
    "Z",
    "0",
    "9",
    "_",
  ],
  should_reject_as_invalid: [
    "/",
    ":",
    "@",
    "[",
    "`",
    "{",
    "-",
  ]
}
