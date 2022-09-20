$ion_schema_1_0
type::{
  name: regex_special_characters,
  regex: "\0\a\b\t\n\v\f\r",
}
$test::{
  type: regex_special_characters,
  should_accept_as_valid: [
    '\0\a\b\t\n\v\f\r',
    "\0\a\b\t\n\v\f\r",
  ],
  should_reject_as_invalid: [
    a,
    "A",
  ]
}
