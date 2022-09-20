$ion_schema_1_0
type::{
  name: regex_case_insensitive,
  regex: i::"hello",
}
$test::{
  type: regex_case_insensitive,
  should_accept_as_valid: [
    hello,
    HellO,
    "hello",
    "HELLO",
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.string,
    null.symbol,
    null.bool,
    '',
    "",
    'goodbye',
  ]
}
