$ion_schema_1_0
type::{
  name: regex_escape_forwardslash,
  regex: "a/b",
}
$test::{
  type: regex_escape_forwardslash,
  should_accept_as_valid: [
    'a/b',
    "a/b",
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.string,
    null.symbol,
    null.bool,
    '',
    "",
    ab,
    "ab",
  ]
}
