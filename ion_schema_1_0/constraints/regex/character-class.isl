$ion_schema_1_0
type::{
  name: regex_character_class,
  regex: "[bcd]",
}
$test::{
  type: regex_character_class,
  should_accept_as_valid: [
    "b",
    "c",
    "d",
  ],
  should_reject_as_invalid: [
    "a",
    "e",
  ]
}
