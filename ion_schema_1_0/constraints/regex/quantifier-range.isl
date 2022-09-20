$ion_schema_1_0
type::{
  name: regex_quantifier_range,
  regex: "ab{3,6}c",
}
$test::{
  type: regex_quantifier_range,
  should_accept_as_valid: [
    "abbbc",
    "abbbbc",
    "abbbbbc",
    "abbbbbbc",
  ],
  should_reject_as_invalid: [
    "abbc",
    "abbbbbbbc",
  ]
}
