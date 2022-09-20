$ion_schema_1_0
type::{
  name: regex_predefined_character_class_digit,
  regex: "\\d",
}
$test::{
  type: regex_predefined_character_class_digit,
  should_accept_as_valid: [
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
  ],
  should_reject_as_invalid: [
    "/",
    ":",
  ]
}
