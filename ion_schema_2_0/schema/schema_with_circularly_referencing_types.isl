$ion_schema_2_0

// The purpose of this test is to ensure that implementations can properly load circularly referencing types
// There are a few value-based test cases just to make sure that the implementation doesn't fail when you
// actually try to use the types.

type::{
  name: struct_of_lists,
  type: struct,
  element: list_of_structs
}

type::{
  name: list_of_structs,
  type: list,
  element: struct_of_lists,
}

$test::{
  type: struct_of_lists,
  should_accept_as_valid: [
    {},
    { a: [] },
    { a: [], b: [] },
    { a: [ { b: [ { c: [] }] } ] },
  ],
  should_reject_as_invalid: [
    [],
    { a: { b: [] } },
  ],
}

$test::{
  type: list_of_structs,
  should_accept_as_valid: [
    [],
    [{}],
    [{ a: [] } ],
    [{ a: [ { b: [ { c: [] } ] } ] } ],
  ],
  should_reject_as_invalid: [
    {},
    [ [ { a: [] } ] ],
    { a: [ [] ] },
  ],
}
