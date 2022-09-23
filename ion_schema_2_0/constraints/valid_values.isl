$ion_schema_2_0

type::{
  name: valid_values_all_value_types,
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
}
$test::{
  type: valid_values_all_value_types,
  should_accept_as_valid: [
    null,
    true,
    foo::true,
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
  should_reject_as_invalid: [
    null.int,
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
    document::(a b c)
  ]
}

type::{
  name: valid_values_list_of_ranges,
  valid_values: [
    range::[-100, exclusive::0],
    range::[exclusive::0, 100],
  ],
}
$test::{
  type: valid_values_list_of_ranges,
  should_accept_as_valid: [
    -1,
    -0.000000000000000000000000001,
    -0.1e0,
    1,
    0.000000000000000000000000001,
    0.1e0,
    99,
    -99,
    100,
    100d0,
    100e0,
    -100,
    -100d0,
    -100e0,
  ],
  should_reject_as_invalid: [
    null,
    null.int,
    null.float,
    null.decimal,
    0,
    0d0,
    -0d0,
    0e0,
    -0e0,
    101,
    100.0000000000000000000000001d0,
    100.00000000000001e0,
    -101,
    -100.0000000000000000000000001d0,
    -100.00000000000001e0,
  ]
}


type::{
  name: valid_values_mix_of_values_and_ranges,
  valid_values: [
    null.int,
    null.decimal,
    null.float,
    -30,
    range::[-20, -10],
    1,
    2d0,
    3e0,
    range::[10, 20],
    30,
    range::[2000T, 2020T],
  ],
}
$test::{
  type: valid_values_mix_of_values_and_ranges,
  should_accept_as_valid: [
    -30,
    -20,
    -20d0,
    -20e0,
    -10,
    -10d0,
    -10e0,
    1,
    2d0,
    3e0,
    10,
    10d0,
    10e0,
    20,
    20d0,
    20e0,
    30,
    null.int,
    null.float,
    null.decimal,
    2010T,
  ],
  should_reject_as_invalid: [
    null,
    0,
    0d0,
    -0d0,
    0e0,
    -0e0,
    101,
    100.0000000000000000000000001d0,
    100.00000000000001e0,
    -101,
    -100.0000000000000000000000001d0,
    -100.00000000000001e0,
    2050T,
  ]
}

$test::{
  description: "valid_values must be a list or range",
  invalid_types: [
    { valid_values: null },
    { valid_values: null.int },
    { valid_values: null.list },
    { valid_values: 5 },
    { valid_values: (foo bar) },
    { valid_values: {} },
    { valid_values: "Hello world!" },
    { valid_values: 'Greetings earthling!' },
    { valid_values: {{ "Hi dude!" }} },
    { valid_values: 2022-05-04T20:22:05.04Z },
    { valid_values: false },
  ]
}

$test::{
  description: "valid_values may not be annotated",
  invalid_types: [
    { valid_values: [ hello::5 ] }
  ]
}
