$ion_schema_1_0
type::{
  name: regex_character_range_negated,
  regex: "[^b-g]",
}
$test::{
  type: regex_character_range_negated,
  should_accept_as_valid: [
    "a",
    "i",
  ],
  should_reject_as_invalid: [
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
  ]
}
