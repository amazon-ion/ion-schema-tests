$ion_schema_2_0

type::{
  name: 'annotations: closed::[foo, bar]',
  annotations: closed::[foo, bar],
}

$test::{
  type: 'annotations: closed::[foo, bar]',
  should_accept_as_valid: [
    0,
    foo::1,
    bar::2.0,
    foo::bar::3e0,
    foo::foo::'4',
    bar::foo::bar::foo::"5",
    foo::null,
  ],
  should_reject_as_invalid: [
    baz::1,
    foo::baz::2,
    bar::baz::3,
    foo::bar::baz::4,
    document::(),
  ],
}

type::{
  // Important use case—no annotations allowed
  name: 'annotations: closed::[]',
  annotations: closed::[],
}

$test::{
  type: 'annotations: closed::[]',
  should_accept_as_valid: [
    0,
    true,
    null,
    [],
    (foo::bar),
    "Hello world!",
  ],
  should_reject_as_invalid: [
    foo::1,
    ''::2,
    document::(),
  ],
}

type::{
  name: 'annotations: required::[foo, bar]',
  annotations: required::[foo, bar],
}

$test::{
  type: 'annotations: required::[foo, bar]',
  should_accept_as_valid: [
    foo::bar::1,
    bar::foo::2,
    foo::bar::baz::3,
    foo::bar::baz::bar::foo::4,
    lorem::ipsum::quando::omni::flunkus::moritae::foo::bar::baz::5,
    foo::bar::null,
  ],
  should_reject_as_invalid: [
    1,
    foo::2,
    bar::3,
    bar::baz::4,
    bar::bar::bar::5,
    foo::bar,
    foo::[bar::baz],
  ],
}

type::{
  name: 'annotations: closed::required::[foo, bar]',
  annotations: closed::required::[foo, bar],
}

$test::{
  type: 'annotations: closed::required::[foo, bar]',
  should_accept_as_valid: [
    foo::bar::1,
    bar::foo::2,
    foo::bar::bar::3,
    foo::bar::foo::4,
    foo::bar::null
  ],
  should_reject_as_invalid: [
    1,
    foo::2,
    bar::3,
    foo::bar::baz::4,
    bar::bar::bar::5,
    quando::omni::flunkus::moritae::6,
    foo::bar,
    foo::[bar::baz],
  ],
}

$test::{
  description: "annotations (simplified) list must be annotated with required or closed",
  invalid_types: [
    { annotations: [foo, bar] },
  ]
}
$test::{
  description: "annotations (simplified) list must not be annotated with anything other that required or closed",
  invalid_types: [
    { annotations: closed::ordered::[foo, bar] },
  ]
}
$test::{
  description: "annotations (simplified) list must not have any annotations on elements of list",
  invalid_types: [
    { annotations: required::[optional::foo, bar] },
  ]
}
$test::{
  description: "annotations (simplified) list must only contain symbols",
  invalid_types: [
    { annotations: required::["foo", bar] },
  ]
}
$test::{
  description: "annotations (simplified) list must not be null",
  invalid_types: [
    { annotations: required::null.list },
  ]
}
