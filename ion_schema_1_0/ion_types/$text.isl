$ion_schema_1_0
$test::{
  type: $text,
  should_accept_as_valid: [
    "",
    "a",
    "hello",
    '',
    'a',
    hello,
    null.string,
    null.symbol,
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.int,
    5,
  ]
}
