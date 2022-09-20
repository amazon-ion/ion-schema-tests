$ion_schema_1_0
type::{
  name: valid_values_all_types,
  valid_values: [
    null,
    true,
    2,
    4e0,
    5.,
    2018T,
    hello,
    "hello",
    {{"hello"}},
    {{aGVsbG8=}},
    [1, 2, 3],
    (4 5 6),
    {a: 7, b: 8, c: 9},
  ],
  type: $any,   // overrides default "type: any"
}
$test::{
  type: valid_values_all_types,
  should_accept_as_valid: [
    null,
    true,
    2,
    4e0,
    5.,
    2018T,
    hello,
    "hello",
    {{"hello"}},
    {{aGVsbG8=}},
    [1, 2, 3],
    (4 5 6),
    {a: 7, b: 8, c: 9},
    hello::2,
  ],
  should_reject_as_invalid: [
    false,
    3,
    5e0,
    6.,
    2018-01T,
    hello2,
    "hello2",
    {{"hello2"}},
    {{aGVsbG9oZWxsb2hlbA==}},
    (1 2 3),
    [4, 5, 6],
    {a: 7, b: 8, c: 9, d: 10},
  ]
}
