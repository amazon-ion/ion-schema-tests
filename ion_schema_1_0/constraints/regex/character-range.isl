$ion_schema_1_0
type::{
  name: regex_character_range,
  regex: "[b-g]",
}
$test::{
  type: regex_character_range,
  should_accept_as_valid: [
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
  ],
  should_reject_as_invalid: [
    "a",
    "i",
  ]
}
