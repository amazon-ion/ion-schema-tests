$ion_schema_1_0
type::{
  name: regex_character_class_compound_negated,
  regex: "[^ac-eh-jmnt-vz]",
}
$test::{
  type: regex_character_class_compound_negated,
  should_accept_as_valid: [
    "b",
    "f",
    "g",
    "k",
    "l",
    "o",
    "p",
    "q",
    "r",
    "s",
    "w",
    "x",
    "y",
  ],
  should_reject_as_invalid: [
    "a",
    "c",
    "d",
    "e",
    "h",
    "i",
    "j",
    "m",
    "n",
    "t",
    "u",
    "v",
    "z",
  ]
}
