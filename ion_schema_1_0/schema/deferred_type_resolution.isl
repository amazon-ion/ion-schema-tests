$ion_schema_1_0

// asserts that all constraints that have a type reference work when
// the referenced type is defined later in the ISL.  in such cases,
// resolution of the type reference is deferred until it is found.

schema_header::{
}
type::{
  name: type,
  type: type_ref,      // the 'type_ref' type is unknown at this point, so resolution is deferred
}
type::{
  name: element,
  element: type_ref,   // ditto
}
type::{
  name: fields,
  fields: {
    a: type_ref,       // ditto
  },
}
type::{
  name: ordered_elements,
  ordered_elements: [type_ref],  // ditto
}
type::{
  name: all_of,
  all_of: [type_ref],  // ditto
}
type::{
  name: any_of,
  any_of: [type_ref],  // ditto
}
type::{
  name: one_of,
  one_of: [type_ref],  // ditto
}
type::{
  name: not,
  not: type_ref,       // ditto
}
type::{
  name: type_ref,      // aha!  here it is!
  codepoint_length: 3,
}
schema_footer::{
}

$test::{
  type: type,
  should_accept_as_valid: [ abc ],
  should_reject_as_invalid: [ ab, abcd ],
}
$test::{
  type: element,
  should_accept_as_valid: [ [abc] ],
  should_reject_as_invalid: [[ab], [abcd] ],
}
$test::{
  type: fields,
  should_accept_as_valid: [ {a: abc} ],
  should_reject_as_invalid: [ {a: ab}, {a: abcd} ],
}
$test::{
  type: ordered_elements,
  should_accept_as_valid: [ [abc] ],
  should_reject_as_invalid: [ [ab], [abcd] ],
}
$test::{
  type: all_of,
  should_accept_as_valid: [ abc ],
  should_reject_as_invalid: [ ab, abcd ],
}
$test::{
  type: any_of,
  should_accept_as_valid: [ abc ],
  should_reject_as_invalid: [ ab, abcd ],
}
$test::{
  type: one_of,
  should_accept_as_valid: [ abc ],
  should_reject_as_invalid: [ ab, abcd ],
}
$test::{
  type: not,
  should_accept_as_valid: [ ab, abcd ],
  should_reject_as_invalid: [ abc ],
}
