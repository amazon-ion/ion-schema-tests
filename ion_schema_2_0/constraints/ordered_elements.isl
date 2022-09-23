$ion_schema_2_0

type::{
  name: ordered_elements_all_required,
  ordered_elements: [
    symbol,
    int,
    bool,
  ]
}

$test::{
  type: ordered_elements_all_required,
  should_accept_as_valid: [
    [hi, 1, false],
    (foo 2 true),
    document::(
      $foo_bar
      123
      false
    )
  ],
  should_reject_as_invalid: [
    null,
    null.list,
    null.sexp,
    [],
    [hi, /*1,*/ false],
    [/*hi,*/ 1, false],
    [hi, 1 /*,false*/],
    [hi, "1", false],
    ["hi", 1, false],
    [hi, 1, "false"],
    [hi, hi, 1, false],
    [hi, 1, 1, false],
    [hi, 1, false, false],
    {a: hi, b: 1, c: false},
    foo,
    123,
    true,
    2022-03-04T,
    1.23,
    1.23e4,
  ]
}

type::{
  name: ordered_elements_all_optional,
  ordered_elements: [
    { occurs: optional, type: symbol },
    { occurs: optional, type: int },
    { occurs: optional, type: bool },
  ]
}

$test::{
  type: ordered_elements_all_optional,
  should_accept_as_valid: [
    (foo 2 true),
    document::(
      $foo_bar
      123
      false
    ),
    [],
    [hi],
    [1],
    [false],
    [hi, 1],
    [hi, false],
    [1, false],
    [hi, 1, false],
  ],
  should_reject_as_invalid: [
    null,
    null.list,
    null.sexp,
    [hi, "1", false],
    ["hi", 1, false],
    [hi, 1, "false"],
    [hi, hi, 1, false],
    [hi, 1, 1, false],
    [hi, 1, false, false],
    {a: hi, b: 1, c: false},
    foo,
    123,
    true,
    2022-03-04T,
    1.23,
    1.23e4,
  ]
}

type::{
  name: ordered_elements_all_at_least_once,
  ordered_elements: [
    { occurs: range::[1, max], type: symbol },
    { occurs: range::[1, max], type: int },
    { occurs: range::[1, max], type: bool },
  ]
}

$test::{
  type: ordered_elements_all_at_least_once,
  should_accept_as_valid: [
    (foo 2 true),
    document::(
    $foo_bar
      123
      false
    ),
    [hi, 1, false],
    [hi, hi, 1, false],
    [hi, hi, hi, 1, false],
    [hi, 1, 1, false],
    [hi, 1, 1, 1, false],
    [hi, 1, false, false],
    [hi, 1, false, false, false],
    [hi, hi, hi, 1, 1, 1, false, false, false],
  ],
  should_reject_as_invalid: [
    null,
    null.list,
    null.sexp,
    [],
    [hi],
    [1],
    [false],
    [hi, 1],
    [hi, false],
    [1, false],
    [hi, "1", false],
    ["hi", 1, false],
    [hi, 1, "false"],
    {a: hi, b: 1, c: false},
    foo,
    123,
    true,
    2022-03-04T,
    1.23,
    1.23e4,
  ]
}

type::{
  name: ordered_elements_ambiguous_matches,
  ordered_elements:[
    { type: int, occurs: optional },
    { type: number, occurs: optional },
    { type: any, occurs: required}
  ]
}

$test::{
  type: ordered_elements_ambiguous_matches,
  should_accept_as_valid: [
    [ 1 ],
    [ 1, 2 ],
    [ 1, 2, 3 ],
    [ 1, 2.0 ],
    [ 1, foo ],
    [ 1.0, foo ],
    [ 1, 2.0, foo ],
    [ foo ],
    [ 2.0 ],
    [ 2022-03-04 ],
  ],
  should_reject_as_invalid: [
    [1, 2, 3, 4 ],
    [1, foo, foo ],
    [1, foo, 1 ],
    [1, foo, 1.0 ],
    [1.0, 1, foo ],
  ]
}

type::{
  name: ordered_elements_mixed_optional,
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
  type: ordered_elements_mixed_optional,
  should_accept_as_valid: [
    [true, hello, false],
    [true, 1, hello, false],
    [true, 2.0, hello, false],
    [true, 3e0, hello, false],
    [true, 1, 2.0, hello, false],
    [true, 1, 3e0, hello, false],
    [true, 2.0, 3e0, hello, false],
    [true, 1, 2.0, 3e0, hello, false],
    (true hello false),
    document::(true hello false),
  ],
  should_reject_as_invalid: [
    (true hello),
    (true {}),
    (true {} true),
    [1, 2.0, 3e0, hello, false],
    [true, 1, 2.0, 3e0, false],
    [true, 1, 2.0, 3e0, hello],
    document::(true hello),
    document::(true false),
    document::(hello false),
  ],
}

type::{
  name: ordered_elements_empty_list,
  ordered_elements: [],
}

$test::{
  type: ordered_elements_empty_list,
  should_accept_as_valid: [
    [],
    (),
    document::(),
  ],
  should_reject_as_invalid: [
    null.list,
    null.sexp,
    {},
    (1 2 3),
    [a, b, c],
    document::(null false true),
  ],
}

$test::{
  description: "ordered_elements must be a list of variably occuring type references",
  invalid_types: [
    { ordered_elements: null, },
    { ordered_elements: null.list },
    { ordered_elements: () },
    { ordered_elements: { any_of: [int, string, symbol] } },
    { ordered_elements: true },
    { ordered_elements: 3 },
    { ordered_elements: int },
    { ordered_elements: (int string symbol) },
    { ordered_elements: range::[1, 2] },
    { ordered_elements: range::[int, string] },
  ],
}
