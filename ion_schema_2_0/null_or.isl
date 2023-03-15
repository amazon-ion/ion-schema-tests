$ion_schema_2_0

// Tests that the $null_or decorator works in various situations—with inline types,
// imported types, etc.
// $null_or allows `null.null` (with any annotations) or a value
// that matches the decorated type.

schema_header::{
  imports: [
    { id: "util.isl", type: positive_int, as: positive_int },
    { id: "util.isl", type: positive_int, as: positive_int_aliased },
  ],
}

type::{
  name: null_or_core_type,
  type: $null_or::string,
}

$test::{
  type: null_or_core_type,
  should_accept_as_valid: [null, "Hello", annotated::null],
  should_reject_as_invalid: [null.string],
}

type::{
  name: null_or_ion_type,
  type: $null_or::$text,
}

$test::{
  type: null_or_ion_type,
  should_accept_as_valid: [null, null.string, null.symbol, "Hello", World, annotated::null],
}

type::{
  name: null_or_inline_type,
  type: $null_or::{
    type: string,
    codepoint_length: range::[0, 10],
  },
}

$test::{
  type: null_or_inline_type,
  should_accept_as_valid: [null, "Hello"],
  should_reject_as_invalid: [null.string],
}


type::{
  name: null_or_inline_import,
  type: $null_or::{ id: "util.isl", type: positive_int },
}

$test::{
  type: null_or_inline_import,
  should_accept_as_valid: [null, 1],
  should_reject_as_invalid: [null.int],
}

type::{
  name: null_or_imported_type,
  type: $null_or::positive_int,
}

$test::{
  type: null_or_imported_type,
  should_accept_as_valid: [null, 1],
  should_reject_as_invalid: [null.int],
}

type::{
  name: null_or_imported_aliased_type,
  type: $null_or::positive_int_aliased,
}

$test::{
  type: null_or_imported_aliased_type,
  should_accept_as_valid: [null, 1],
  should_reject_as_invalid: [null.int],
}

type::{
  name: null_or_forward_referenced_type,
  type: $null_or::another_int,
}

$test::{
  type: null_or_forward_referenced_type,
  should_accept_as_valid: [null, 1],
  should_reject_as_invalid: [null.int],
}

type::{
  name: another_int,
  type: int,
}


$test::{
  description: "null_or may not be present on a variably occurring type",
  invalid_types: [
    { ordered_elements: [ $null_or::{ type: string, occurs: 2} ], },
    { fields: { nullable_field: $null_or::{ type: string, occurs: 2} }, },
  ],
}

schema_footer::{}

