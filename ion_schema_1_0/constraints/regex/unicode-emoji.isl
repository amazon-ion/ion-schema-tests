$ion_schema_1_0
type::{
  name: regex_unicode_emoji,
  regex: "^[😀\U0001f642😊]{3,6}$",
}
$test::{
  type: regex_unicode_emoji,
  should_accept_as_valid: [
    "😊😀🙂",
    "🙂🙂🙂🙂",
    "😊😊😊😊😊",
    "😊😀🙂😊😀🙂",
    "\U0001f600\U0001f600\U0001f600",
  ],
  should_reject_as_invalid: [
    "😊😀",
    "😊😀🙂😊😀🙂😊",
  ]
}
