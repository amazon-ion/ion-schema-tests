$ion_schema_2_0

$test::{
  description: "user_reserved_fields declaration must be a non-null, unannotated struct",
  invalid_schemas:[
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: a_symbol }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: null.struct }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: [a, b, c] }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: foo::{} }
      schema_footer::{}
    ),
  ]
}

$test::{
  description: "user_reserved_fields declaration may not have unexpected fields",
  invalid_schemas:[
    (
      $ion_schema_2_0
      schema_header::{
        user_reserved_fields: {
          type: [ a, b, c ],
          // 'foo' is not one of the allowed fields in the user_reserved_fields struct
          foo: [ d, e, f ],
        }
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        user_reserved_fields: {
          type: [a, b, c],
          // Not even unreserved field names.
          $Foo: [d, e, f],
        }
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        user_reserved_fields: {
          type: [a, b, c],
          // Unexpected repetition of the field name
          type: [d, e, f],
        }
      }
      schema_footer::{}
    ),
  ]
}

$test::{
  description: "user_reserved_fields declaration fields must be an unannotated, non-null list",
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: (a b c), } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: foo::[a, b, c], } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: null.list, } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: (a b c), } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: foo::[a, b, c], } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: null.list, } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: (a b c), } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: foo::[a, b, c], } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: null.list, } }
      schema_footer::{}
    ),
  ]
}

$test::{
  description: "declared user_reserved_fields symbols must be non-null, unannotated symbols",
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [foo::a, b, c], } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: ["abc"], } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [null.symbol], } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [null], } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [a, foo::b, c], } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: ["abc"], } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [null.symbol], } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [null], } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [a, b, foo::c], } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: ["abc"], } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [null.symbol], } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [null], } }
      schema_footer::{}
    ),
  ]
}

$test::{
  description: "user_reserved_fields declaration may have empty containers",
  valid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [], } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [], } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [], } }
      schema_footer::{}
    ),
  ]
}

$test::{
  description: "ISL 2.0 keywords may not be declared as user fields for the schema header",
  invalid_schemas:[
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ all_of ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ annotations ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ any_of ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ as ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ byte_length ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ codepoint_length ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ container_length ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ contains ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ element ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ exponent ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ field_names ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ fields ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ id ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ imports ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ name ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ not ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ occurs ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ one_of ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ ordered_elements ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ precision ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ regex ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ schema_footer ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ schema_header ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ timestamp_offset ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ timestamp_precision ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ type ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ user_reserved_fields ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ utf8_byte_length ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_header: [ valid_values ] } }
      schema_footer::{}
    ),
  ]
}

$test::{
  description: "ISL 2.0 keywords may not be declared as user fields for type definitions",
  invalid_schemas:[
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ all_of ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ annotations ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ any_of ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ as ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ byte_length ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ codepoint_length ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ container_length ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ contains ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ element ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ exponent ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ field_names ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ fields ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ id ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ imports ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ name ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ not ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ occurs ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ one_of ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ ordered_elements ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ precision ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ regex ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ schema_footer ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ schema_header ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ timestamp_offset ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ timestamp_precision ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ type ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ user_reserved_fields ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ utf8_byte_length ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [ valid_values ] } }
      schema_footer::{}
    ),
  ]
}

$test::{
  description: "ISL 2.0 keywords may not be declared as user fields for the schema footer",
  invalid_schemas:[
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ all_of ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ annotations ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ any_of ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ as ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ byte_length ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ codepoint_length ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ container_length ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ contains ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ element ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ exponent ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ field_names ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ fields ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ id ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ imports ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ name ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ not ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ occurs ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ one_of ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ ordered_elements ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ precision ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ regex ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ schema_footer ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ schema_header ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ timestamp_offset ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ timestamp_precision ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ type ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ user_reserved_fields ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ utf8_byte_length ] } }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [ valid_values ] } }
      schema_footer::{}
    ),
  ]
}
