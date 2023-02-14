$ion_schema_2_0

$test::{
  description: "Top-level open content can appear anywhere in the schema document",
  valid_schemas:[
    (
      "Non-ISL content can occur before the version marker,"
      $ion_schema_2_0
    ),
    (
      $ion_schema_2_0
      "...between the version marker and header,"
      schema_header::{}
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      "...between the header and a type,"
      type::{ name: foo }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      "...between the version marker and a type,"
      type::{ name: foo }
    ),
    (
      $ion_schema_2_0
      type::{ name: foo }
      "...between two types,"
      type::{ name: bar }
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      type::{ name: foo }
      "...between a type and the footer,"
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      schema_footer::{}
      "... or even after the footer."
    ),
  ]
}

$test::{
  description: "Any type of Ion value can be top-level open content",
  valid_schemas:[
    ( $ion_schema_2_0 null ),
    ( $ion_schema_2_0 true ),
    ( $ion_schema_2_0 2000 ),
    ( $ion_schema_2_0 3000e0 ),
    ( $ion_schema_2_0 4000d0 ),
    ( $ion_schema_2_0 5000T ),
    ( $ion_schema_2_0 "abc" ),
    ( $ion_schema_2_0 'DEF' ),
    ( $ion_schema_2_0 {{ GHI= }} ),
    ( $ion_schema_2_0 {{ "jkl" }} ),
    ( $ion_schema_2_0 { a: 1 } ),
    ( $ion_schema_2_0 [ 1, 2, 3 ] ),
    ( $ion_schema_2_0 ( 1 2 3 ) ),
  ]
}

$test::{
  description: "Reserved symbols that are not version markers can be top-level user content",
  valid_schemas: [
    ( $ion_schema_2_0 so many reserved symbols right here ),
    ( $ion_schema_2_0 ion_schema_2_0 ),
    ( $ion_schema_2_0 $ion_schema_x_1 ),
  ]
}

$test::{
  description: "ISL keywords can be top-level user content",
  valid_schemas:[
    ( $ion_schema_2_0 all_of ),
    ( $ion_schema_2_0 annotations ),
    ( $ion_schema_2_0 any_of ),
    ( $ion_schema_2_0 as ),
    ( $ion_schema_2_0 byte_length ),
    ( $ion_schema_2_0 codepoint_length ),
    ( $ion_schema_2_0 container_length ),
    ( $ion_schema_2_0 contains ),
    ( $ion_schema_2_0 element ),
    ( $ion_schema_2_0 exponent ),
    ( $ion_schema_2_0 field_names ),
    ( $ion_schema_2_0 fields ),
    ( $ion_schema_2_0 id ),
    ( $ion_schema_2_0 imports ),
    ( $ion_schema_2_0 name ),
    ( $ion_schema_2_0 not ),
    ( $ion_schema_2_0 occurs ),
    ( $ion_schema_2_0 one_of ),
    ( $ion_schema_2_0 ordered_elements ),
    ( $ion_schema_2_0 precision ),
    ( $ion_schema_2_0 regex ),
    ( $ion_schema_2_0 schema_footer ),
    ( $ion_schema_2_0 schema_header ),
    ( $ion_schema_2_0 timestamp_offset ),
    ( $ion_schema_2_0 timestamp_precision ),
    ( $ion_schema_2_0 type ),
    ( $ion_schema_2_0 user_reserved_fields ),
    ( $ion_schema_2_0 utf8_byte_length ),
    ( $ion_schema_2_0 valid_values ),
  ]
}

$test::{
  // Ion Schema version markers are ^\$ion_schema_\d.*
  // https://amazon-ion.github.io/ion-schema/docs/isl-versioning#ion-schema-version-markers
  description: "an Ion Schema version marker (even an invalid one) is never valid user content",
  invalid_schemas:[
    ( $ion_schema_2_0 $ion_schema_123_456 ),
    ( $ion_schema_2_0 $ion_schema_2 ),
    ( $ion_schema_2_0 $ion_schema_2_0_0 ),
    ( $ion_schema_2_0 '$ion_schema_2.0' ),
  ]
}

$test::{
  description: "top-level user content may be annotated with any symbols that are not reserved symbols",
  valid_schemas: [
    ( $ion_schema_2_0 ''::0 ),
    ( $ion_schema_2_0 $lower_snake_case_with_a_leading_dollar_sign::1 ),
    ( $ion_schema_2_0 _lower_snake_case_with_leading_underscore::2 ),
    ( $ion_schema_2_0 SCREAMING_SNAKE_CASE::3 ),
    ( $ion_schema_2_0 'UPPER-KEBAB-CASE'::4 ),
    ( $ion_schema_2_0 'lower-kebab-case'::5 ),
    ( $ion_schema_2_0 camelCase::6 ),
    ( $ion_schema_2_0 'annotation with whitespace'::7 ),
    ( $ion_schema_2_0 '🥧_foo'::8 ),
    ( $ion_schema_2_0 'é∑å®ê'::9 ),
    ( $ion_schema_2_0 _::10 ),
    ( $ion_schema_2_0 $::11 ),
    ( $ion_schema_2_0 'éomer'::12 ),
    ( $ion_schema_2_0 $ion_schemabutnotreally::13 ),
    ( $ion_schema_2_0 Multiple::_annotations::$are::OK::"too" ),
  ]
}

$test::{
  description: "top-level user content may not be annotated with any reserved symbols",
  invalid_schemas:[
    ( $ion_schema_2_0 $ion_schema::1 ),
    ( $ion_schema_2_0 $ion_schema_abc::1 ),
    ( $ion_schema_2_0 $ion_schema_2_0::1 ),
    ( $ion_schema_2_0 lower_snake_case::1 ),
    // Even if there's an unreserved symbol, the reserved symbol still makes this invalid
    ( $ion_schema_2_0 _foo::bar::1 ),
  ]
}

$test::{
  description: "an annotated Ion Schema version marker is not valid ",
  invalid_schemas:[
    ( $ion_schema_2_0 _foo::$ion_schema_2_0 )
  ]
}
