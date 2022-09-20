$ion_schema_1_0
type::{
  name: regex_ion_escape_characters,
  regex: "\0\a\b\t\n\f\r\v",
}
$test::{
  type: regex_ion_escape_characters,
  should_accept_as_valid: [
    '\0\a\b\t\n\f\r\v',
    "\0\a\b\t\n\f\r\v",
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.string,
    null.symbol,
    null.bool,
    'hello world',
    "hello world",
  ]
}
