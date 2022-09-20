$ion_schema_1_0
type::{
  name: regex_escape_single_quote,
  regex: "it's",
}
$test::{
  type: regex_escape_single_quote,
  should_accept_as_valid: [
    'it\'s',
    "it's",
    'I can\'t believe it\'s not butter!',
    "I can't believe it's not butter!",
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.string,
    null.symbol,
    null.bool,
    '',
    "",
    its,
    "its",
  ]
}
