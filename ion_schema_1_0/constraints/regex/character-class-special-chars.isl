$ion_schema_1_0
type::{
  name: regex_character_class_special_chars,
  regex: "[\0\a\b\t\n\v\f\r]",
}
$test::{
  type: regex_character_class_special_chars,
  should_accept_as_valid: [
    "\0",
    "\a",
    "\b",
    "\t",
    "\n",
    "\v",
    "\f",
    "\r",
  ],
  should_reject_as_invalid: [
    "a",
    ".",
  ]
}
