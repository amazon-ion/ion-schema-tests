$ion_schema_1_0
type::{
  name: regex_character_any,
  regex: "^.$",
}
$test::{
  type: regex_character_any,
  should_accept_as_valid: [
    "a",
    "B",
    "9",
    "😊",
  ],
  should_reject_as_invalid: [
    null,
    "",
    "\n",
    "\r",
  ]
}
