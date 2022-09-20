$ion_schema_1_0
type::{
  name: regex_quantifier_exactly_n,
  regex: "ab{3}c",
}
$test::{
  type: regex_quantifier_exactly_n,
  should_accept_as_valid: [
    "abbbc",
  ],
  should_reject_as_invalid: [
    "abbc",
    "abbbbc",
  ]
}
