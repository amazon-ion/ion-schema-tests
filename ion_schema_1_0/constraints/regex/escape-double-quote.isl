$ion_schema_1_0
type::{
  name: regex_escape_double_quote,
  regex: "\"free\"",
}
$test::{
  type: regex_escape_double_quote,
  should_accept_as_valid: [
    '"free"',
    "\"free\"",
    'Totally "free" food!',
    "Totally \"free\" food!",
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.string,
    null.symbol,
    null.bool,
    '',
    "",
    'free',
    "free",
  ]
}
