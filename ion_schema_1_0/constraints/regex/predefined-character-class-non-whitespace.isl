$ion_schema_1_0
type::{
  name: regex_predefined_character_class_non_whitespace,
  regex: "\\S",
}
$test::{
  type: regex_predefined_character_class_non_whitespace,
  should_accept_as_valid: [
    "\0",
    "\b",
    "\v",
    "a",
    "9",
  ],
  should_reject_as_invalid: [
    " ",
    "\f",
    "\n",
    "\r",
    "\t",
  ]
}
