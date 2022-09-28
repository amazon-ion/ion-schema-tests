$ion_schema_2_0

$test::{
  description: "Regex must be a non-null string",
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
  description: "Regex must not have unknown modifier annotations",
  invalid_types: [
    { regex: ''::"foo" },
    { regex: F::"foo" },
    { regex: M::"foo" },
    { regex: I::"foo" },
    { regex: mi::"foo" },
    { regex: m::I::"foo" },
    { regex: '🥧'::"foo" },
  ]
}

$test::{
  description: "Backreferences are not allowed",
  invalid_types: [
    { regex: "\\1" },
  ]
}

$test::{
  description: "POSIX character classes are not allowed",
  invalid_types: [
    { regex: "\\p{Lower}" },
  ]
}

$test::{
  description: "Invalid escaped character",
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
  description: "invalid character classes/ranges",
  invalid_types: [
    { regex: "[a-d[m-p]]" },
    { regex: "[a-z&&[def]]" },
    { regex: "[\\p{L}]" },
  ]
}

$test::{
  description: "reluctant quantifiers are not allowed",
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
  description: "possessive quantifiers are not allowed",
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
  description: '''special constructs with prefix "(?" are not allowed''',
  invalid_types:[
    { regex: "(?" }
  ],
}
