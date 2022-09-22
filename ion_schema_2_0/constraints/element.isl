$ion_schema_2_0

type::{
  name: 'element: int',
  element: int,
}

$test::{
  type: 'element: int',
  should_accept_as_valid: [
    [],
    [1],
    [1, 2, foo::3],
    foo::[1, 2, 3],
    [1, 1, 1],
    (),
    (1),
    (1 2 3),
    foo::(1 2 3),
    {},
    { a: 1 },
    { a: 1, a: 2 },
    { a: 1, b: 2 },
    document::(),
    document::(1),
    document::(1 2 3),
    document::(1 2 3),
  ],
  should_reject_as_invalid: [
    null.list,
    null.sexp,
    null.struct,
    { a: 1, a: 2.0 },
    [1, 2.0],
    1,
  ],
}

type::{
  name: 'element: $null_or::number',
  element: $null_or::number,
}

$test::{
  type: 'element: $null_or::number',
  should_accept_as_valid: [
    {},
    [1, 2.0, 3e2, nan],
    (+inf -inf),
    [1, null, 3],
    { a: 1, a: 2.0 },
    [1, 2.0],
  ],
  should_reject_as_invalid: [
    [null.int],
    [null, null.int ],
    null,
    null.int
  ],
}

type::{
  name: 'element: distinct::$int',
  element: distinct::$int,
}

$test::{
  type: 'element: distinct::$int',
  should_accept_as_valid: [
    [],
    [1],
    [1, 2, 3, null.int],
    [a::1, b::1, c::1],
    (),
    (1),
    (1 2 3),
    {},
    { a: 1 },
    { a: 1, b: 2 },
    { a: 1, a: 2 },
  ],
  should_reject_as_invalid: [
    null.list,
    null.sexp,
    null.struct,
    { a: 1, b: 1 },
    { a: 1, a: 1 },
    [1, 1],
    [null.int, null],
    [null.int, null.int],
    [1, 1.0],
    1,
  ],
}

type::{
  name: 'element: nothing',
  element: nothing,
}

$test::{
  type: 'element: nothing',
  should_accept_as_valid: [
    {},
    [],
    (),
    document::(),
  ],
  should_reject_as_invalid: [
    null,
    null.list,
    null.sexp,
    null.struct,
    [a],
    (1 2),
    { a: 1 },
    document::(true false),
    [null],
  ],
}

type::{
  name: element_with_inline_type,
  element: { codepoint_length: 5 },
}

$test::{
  type: element_with_inline_type,
  should_accept_as_valid: [
    ["Hello", World],
    ("Hello" World),
    { a: "Hello", b: World },
    document::("Hello" World),
  ],
  should_reject_as_invalid: [
    null.list,
    null.sexp,
    null.struct,
    ["Greetings", Earthling],
    ("Greetings" Earthling),
    { a: "Greetings", b: Earthling },
    document::("Greetings" Earthling),
    ["Hi", Dude],
    ("Hi" Dude),
    { a: "Hi", b: Dude },
    document::("Hi" Dude),
    ["Ciao", "amico"],
    ("Ciao" "amico"),
    { a: "Ciao", b: "amico" },
    document::("Ciao" "amico"),
  ],
}

type::{
  name: element_with_inline_import,
  element: { id: 'util.isl', type: positive_int }
}

$test::{
  type: element_with_inline_import,
  should_accept_as_valid: [
    [1, 2, 3],
    (4 5 6),
    { a: 1, b: 2, c: 3 },
    document::(11 12 13 14 15),
  ],
  should_reject_as_invalid: [
    (x + y),
    [0, 1, 2, 3],
    (23 -42),
    [null.int],
    null,
    null.list,
    null.sexp,
    null.struct,
  ],
}

$test::{
  description: "element must be a type reference",
  invalid_types: [
    { element: null },
    { element: null.int },
    { element: 5 },
    { element: [int, string] },
    { element: "$int" },
  ]
}

$test::{
  description: "element must not be a variably occurring type reference",
  invalid_types: [
    { element: { occurs: 2, type: int } },
  ],
}

$test::{
  description: "element must not be a named type definition",
  invalid_types: [
    { element: { name: foo, type: int } },
  ],
}

$test::{
  description: "element type reference may not have unknown annotations",
  invalid_types: [
    { element: foo::int },
    { element: distinct::foo::string },
  ]
}
