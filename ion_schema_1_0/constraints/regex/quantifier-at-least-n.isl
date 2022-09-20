$ion_schema_1_0
type::{
  name: regex_quantifier_at_least_n,
  regex: "ab{3,}c",
}
$test::{
  type: regex_quantifier_at_least_n,
  should_accept_as_valid: [
    "abbbc",
    "abbbbc",
    "abbbbbc",
  ],
  should_reject_as_invalid: [
    "ac",
    "abc",
    "abbc",
  ]
}
