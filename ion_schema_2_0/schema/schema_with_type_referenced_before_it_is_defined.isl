$ion_schema_2_0

// The purpose of this test is to ensure that implementations can properly load when types are referenced before
// they are defined. There are a few value-based test cases just to make sure that the implementation doesn't
// fail when you actually try to use the types.

type::{
  name: a_type,
  fields: {
    // Neither of these types are defined yet
    b: b_type,
    c: c_type,
  },
}

type::{
  name: b_type,
  type: list,
  element: c_type, // c_type is still not defined
}

type::{
  name: c_type,
  type: int,
  valid_values: range::[0, max],
}

$test::{
  type: a_type,
  should_accept_as_valid: [
    {},
    {b: [1]},
    {b: [1, 2], c: 3},
  ],
}
