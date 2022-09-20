$ion_schema_1_0
type::{
  name: regex_quantifier_zero_or_one,
  regex: "ab?c",
}
$test::{
  type: regex_quantifier_zero_or_one,
  should_accept_as_valid: [
    "ac",
    "abc",
  ],
  should_reject_as_invalid: [
    "abbc",
  ]
}
