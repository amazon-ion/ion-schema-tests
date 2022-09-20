$ion_schema_1_0
type::{
  name: regex_escape_characters,
  regex: "\\.\\^\\$\\|\\?\\*\\+\\[\\]\\(\\)\\{\\}\\\\",
}
$test::{
  type: regex_escape_characters,
  should_accept_as_valid: [
    '.^$|?*+[](){}\\',
    ".^$|?*+[](){}\\",
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
