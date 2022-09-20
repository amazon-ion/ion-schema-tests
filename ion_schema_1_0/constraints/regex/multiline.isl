$ion_schema_1_0
type::{
  name: regex_multiline,
  regex: m::"^hello world$",
}
$test::{
  type: regex_multiline,
  should_accept_as_valid: [
    'hello world',
    'hello world\n\n\n',
    '\n\n\nhello world',
    '\n\n\nhello world\n\n\n',
    '\r\r\rhello world\r\r\r',

    "hello world",
    "hello world\n\n\n",
    "\n\n\nhello world",
    "\n\n\nhello world\n\n\n",
    "\r\r\rhello world\r\r\r",
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.string,
    null.symbol,
    null.bool,
    " hello world",
    "hello world ",
    "\n hello world",
    "hello world \n",
    "hello\n world",
    "hello \nworld",
    "hello\r world",
    "hello \rworld",
  ]
}
