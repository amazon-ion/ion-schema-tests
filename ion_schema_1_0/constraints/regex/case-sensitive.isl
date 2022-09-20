$ion_schema_1_0
type::{
  name: regex_case_sensitive,
  regex: "hello",
}
$test::{
  type: regex_case_sensitive,
  should_accept_as_valid: [
    hello,
    "hello",
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.string,
    null.symbol,
    null.bool,
    '',
    "",
    HellO,
    "HELLO",
  ]
}
