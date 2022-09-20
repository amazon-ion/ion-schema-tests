$ion_schema_1_0
type::{
  name: regex_character_class_word_char,
  regex: "[A-Za-z0-9]",
}
$test::{
  type: regex_character_class_word_char,
  should_accept_as_valid: [
    "A",
    "M",
    "Z",
    "a",
    "n",
    "z",
    "0",
    "5",
    "9",
  ],
  should_reject_as_invalid: [
    " ",
    ".",
    "\t",
    "#",
    "~",
  ]
}
