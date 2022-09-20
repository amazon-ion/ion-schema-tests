$ion_schema_1_0
type::{
  name: regex_quantifier_one_to_many,
  regex: "ab+c",
}
$test::{
  type: regex_quantifier_one_to_many,
  should_accept_as_valid: [
    "abc",
    "abbc",
    "abbbc",
  ],
  should_reject_as_invalid: [
    "ac",
  ]
}
