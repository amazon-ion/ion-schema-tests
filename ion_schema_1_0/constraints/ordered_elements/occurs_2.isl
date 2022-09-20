$ion_schema_1_0
type::{
  name: ordered_elements_occurs_2,
  ordered_elements: [
    { type: bool, occurs: required },
    { type: int, occurs: optional },
    { type: decimal, occurs: optional },
    { type: float, occurs: optional },
    { type: symbol, occurs: required },
    { type: bool, occurs: required },
  ],
}
$test::{
  type: ordered_elements_occurs_2,
  should_accept_as_valid: [
    (true hello false),
    document::(true hello false),
  ],
  should_reject_as_invalid: [
    (true hello),
    (true {}),
    (true {} true),
    document::(true hello),
  ]
}
