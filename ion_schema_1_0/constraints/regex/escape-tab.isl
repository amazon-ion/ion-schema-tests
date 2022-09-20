$ion_schema_1_0
type::{
  name: regex_escape_tab,
  regex: "hello\tworld",
}
$test::{
  type: regex_escape_tab,
  should_accept_as_valid: [
    'hello\tworld',
    'hello	world',
    "hello\tworld",
    "hello	world",
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

type::{
  name: regex_unescaped_tab,
  // There is an unescaped tab character in this regex
  regex: "hello	world",
}
$test::{
  type: regex_unescaped_tab,
  should_accept_as_valid: [
    'hello\tworld',
    'hello	world',
    "hello\tworld",
    "hello	world",
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
