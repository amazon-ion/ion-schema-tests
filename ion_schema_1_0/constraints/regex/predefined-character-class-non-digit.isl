$ion_schema_1_0
type::{
  name: regex_predefined_character_class_non_digit,
  regex: "\\D",
}
$test::{
  type: regex_predefined_character_class_non_digit,
  should_accept_as_valid: [
    "/",
    ":",
  ],
  should_reject_as_invalid: [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
  ]
}
