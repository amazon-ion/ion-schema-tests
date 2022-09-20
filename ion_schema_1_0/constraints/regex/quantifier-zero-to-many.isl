$ion_schema_1_0
type::{
  name: regex_quantifier_zero_to_many,
  regex: "ab*c",
}
$test::{
  type: regex_quantifier_zero_to_many,
  should_accept_as_valid: [
    "ac",
    "abc",
    "abbc",
    "abbbc",
  ],
  should_reject_as_invalid: [
    "",
    "ab",
    "bc",
  ]
}
