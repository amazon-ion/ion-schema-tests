$ion_schema_1_0

// Tests that the `nullable` decorator works in various situations—with inline types,
// imported types, etc.
// `nullable` allows `null.null` (with any annotations), the null for the Ion type of
// the decorated type (also with any annotations), or any value that matches the decorated type.

schema_header::{
  imports: [
    { id: "schema/util/positive_int.isl", type: positive_int, as: positive_int },
    { id: "schema/util/positive_int.isl", type: positive_int, as: positive_int_aliased },
  ],
}

type::{
  name: nullable_core_type,
  type: nullable::string,
}

$test::{
  type: nullable_core_type,
  should_accept_as_valid: [null, "Hello", annotated::null, null.string],
  should_reject_as_invalid: [null.int],
}

type::{
  name: nullable_ion_type,
  type: nullable::$string,
}

$test::{
  type: nullable_ion_type,
  should_accept_as_valid: [null, null.string, "Hello", annotated::null],
  should_reject_as_invalid: [null.int],
}

type::{
  name: nullable_inline_type,
  type: nullable::{
    type: string,
    codepoint_length: range::[0, 10],
  },
}

$test::{
  type: nullable_inline_type,
  should_accept_as_valid: [null, "Hello", null.string],
  should_reject_as_invalid: [null.symbol],
}


type::{
  name: nullable_inline_import,
  type: nullable::{ id: "schema/util/positive_int.isl", type: positive_int },
}

$test::{
  type: nullable_inline_import,
  should_accept_as_valid: [null, 1, null.int],
  should_reject_as_invalid: [null.float],
}

type::{
  name: nullable_imported_type,
  type: nullable::positive_int,
}

$test::{
  type: nullable_imported_type,
  should_accept_as_valid: [null, 1, null.int],
  should_reject_as_invalid: [null.float],
}

type::{
  name: nullable_imported_aliased_type,
  type: nullable::positive_int_aliased,
}

$test::{
  type: nullable_imported_aliased_type,
  should_accept_as_valid: [null, 1, null.int],
  should_reject_as_invalid: [null.float],
}

type::{
  name: nullable_forward_referenced_type,
  type: nullable::another_int,
}

$test::{
  type: nullable_forward_referenced_type,
  should_accept_as_valid: [null, 1, null.int],
  should_reject_as_invalid: [null.float],
}

type::{
  name: another_int,
  type: int,
}


$test::{
  description: "nullable may not be present on a variably occurring type",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { ordered_elements: [ nullable::{ type: string, occurs: 2} ], },
    { fields: { nullable_field: nullable::{ type: string, occurs: 2} }, },
  ],
}

schema_footer::{}

