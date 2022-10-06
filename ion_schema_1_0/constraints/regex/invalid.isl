$ion_schema_1_0
$test::{
  description: "regex must be a non-null string",
  invalid_types: [
    { regex: null },
    { regex: null.string },
    { regex: 5 },
    { regex: [] },
    { regex: () },
    { regex: {} },
  ]
}

$test::{
  description: "regex - backreferences are not allowed",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { regex: "\\1" }
  ]
}

$test::{
  description: "regex - POSIX character classes are not allowed",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { regex: "\\p{Lower}" }
  ]
}

$test::{
  description: "regex - invalid escaped character",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { regex: "\\A" },
    { regex: "\\b" },
    { regex: "\\B" },
    { regex: "\\c" },
    { regex: "\\e" },
    { regex: "\\E" },
    { regex: "\\G" },
    { regex: "\\h" },
    { regex: "\\H" },
    { regex: "\\R" },
    { regex: "\\v" },
    { regex: "\\V" },
    { regex: "\\Q" },
    { regex: "\\Z" },
    { regex: "\\z" },
  ]
}

$test::{
  description: "regex - invalid character classes/ranges",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { regex: "[a-d[m-p]]" },
    { regex: "[a-z&&[def]]" },
    { regex: "[\\p{L}]" },
  ]
}

$test::{
  description: "regex - reluctant quantifiers are not allowed",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { regex: "abc??" },
    { regex: "abc*?" },
    { regex: "abc+?" },
    { regex: "abc{1}?" },
    { regex: "abc{1,}?" },
    { regex: "abc{1,2}?" },
  ]
}

$test::{
  description: "regex - possessive quantifiers are not allowed",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { regex: "abc?+" },
    { regex: "abc*+" },
    { regex: "abc++" },
    { regex: "abc{1}+" },
    { regex: "abc{1,}+" },
    { regex: "abc{1,2}+" },
  ]
}

$test::{
  description: "regex - special constructs with prefix '(?' are not allowed",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { regex: "(?" }
  ]
}
