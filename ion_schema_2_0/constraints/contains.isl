$ion_schema_2_0

type::{
  name: 'contains: []',
  contains: [],
}

$test::{
  type: 'contains: []',
  // Should match any non-null container type
  should_accept_as_valid:[
    (),
    {},
    [],
    document::(),
    [a, 1, true, 2022-01-01T],
  ],
  should_reject_as_invalid:[
    null,
    null.list,
    null.struct,
    null.sexp,
    "foo",
  ]
}

type::{
  name: 'contains: [true, 1, a, null]',
  contains: [true, 1, a, null],
}

$test::{
  // Test various "normal" values.
  type: 'contains: [true, 1, a, null]',
  should_accept_as_valid:[
    [true, 1, a, null],
    [a, null, 1, true],
    (null 1 a true),
    [true, 1, 1, 1, a, null],
    [false, foo::true, null, true, bar::1, 384, [abc], 1, a],
    { a: true, a: 1, a: a, a: null },
    { a: true, b: 1, c: a, d: null },
    document::(true 1 a null),
  ],
  should_reject_as_invalid:[
    [true, 1, null],
    [true, foo::1, a, null],
    (foo::true 1 a null),
    { a: true, b: 1, c: foo::a, d: null },
    document::(true 1 a foo::null),
    [true, 1.0, a, null],
    [true, 1, a, null.int],
    { 'true': foo, '1': foo, a: foo, 'null': foo },
    (),
  ]
}

type::{
  name: 'contains: [[a]]',
  contains: [[a]],
}

$test::{
  type: 'contains: [[a]]',
  should_accept_as_valid:[
    [true, [a]],
    [[a]],
    ([a]),
    { abc: [a] }
  ],
  should_reject_as_invalid:[
    [a],
    [a, []],
    [[[a]]],
    [1, [a, b], 2]
  ]
}

type::{
  name: 'contains: [1, 1]',
  contains: [1, 1],
}

$test::{
  type: 'contains: [1, 1]',
  should_accept_as_valid:[
    [1],
    [1, 2, 3],
    (1 2 3),
    { a: 1 },
  ],
  should_reject_as_invalid:[
    [],
    [[1, 1]],
  ]
}

type::{
  name: 'contains: [foo::bar::1]',
  contains: [foo::bar::1],
}

$test::{
  type: 'contains: [foo::bar::1]',
  should_accept_as_valid:[
    [foo::bar::1],
    [+inf, foo::bar::1, abc, null],
  ],
  should_reject_as_invalid:[
    [1],
    [foo::1],
    [bar::foo::1],
    [foo::bar::baz::1],
  ]
}

$test::{
  description: "contains must only be a list of values",
  invalid_types:[
    { contains: null },
    { contains: null.list },
    { contains: () },
    { contains: {} },
    { contains: foo },
    { contains: 1 },
    { contains: range::[1, 5] },
  ]
}
