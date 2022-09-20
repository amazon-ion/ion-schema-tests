$ion_schema_1_0
type::{
  name: regex_predefined_character_class_whitespace,
  regex: "\\s",
}
$test::{
  type: regex_predefined_character_class_whitespace,
  should_accept_as_valid: [
    " ",
    "\f",
    "\n",
    "\r",
    "\t",
  ],
  should_reject_as_invalid: [
    "\0",
    "\b",
    "\v",
    "a",
    "9",
  ]
}
