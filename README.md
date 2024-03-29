## Ion Schema Tests

This collection of files represents a test suite for implementations of the [Ion Schema Specifications](https://amazon-ion.github.io/ion-schema/docs).
This file describes how the tests are defined.

There are four explicit and two implicit types of test cases.

1. `valid_schema` (implicit) – asserts that a schema document is valid.
   Every test file should be a valid schema, so this is implied for every schema/file that is present in the test suite.
2. `valid_schemas` – asserts that each schema document in a given list of schema documents is valid.
3. `invalid_schemas` – asserts that each schema document in a given list of schema documents is invalid.
4. `valid_type` – (implicit) asserts that a given type definition is valid.
   Every top-level type in the test suite loaded and implicitly tested for validity. 
5. `invalid_types` – asserts that each type in a given list of type definitions is invalid.
6. `type`/`should_accept_as_valid`/`should_reject_as_invalid` – tests whether values match or do not match a given type.

#### Implicit Tests
Every `ion-schema-tests` test file should be an Ion Schema.
Implicitly, every test runner should assert that the schema document is a valid Ion Schema, and (by extension) that any types declared in the schema are valid.
```ion

$ion_schema_2_0

type::{
  name: short_string,
  type: string,
  codepoint_length: range::[0, 10],
}
```

#### `type`/`should_accept_as_valid`/`should_reject_as_invalid` Tests
A test case that checks to see if certain values match a type.
The type name should be descriptive of the specific functionality being tested.
```ion
type::{
  name: string_with_codepoint_length_range,
  type: string,
  codepoint_length: range::[0, 10],
}

$test::{
  type: string_with_codepoint_length_range,
  should_accept_as_valid: [
    "",
    "Hello!",
    "Hello Bob!"
  ],
  should_reject_as_invalid: [
    null.string,
    "Hello World",
    "Hello World!",
    'Hello!',
    123,
    document::(
      foo
      bar
      baz
    )
  ],
}
```

#### `invalid_schemas` Tests
A test case that checks that the given schema documents are correctly recognized as invalid.
```ion
$test::{
  // A useful description of the test to aid with debugging, understanding the spec, etc.
  description: "A schema with two version markers is invalid",

  // Indicates that ISL for ISL cannot detect that this schema as invalid. 
  // This is an optional field that indicates whether an ISL for ISL test runners should run this test case.
  // If the field is not present, it is assumed to be "true".
  isl_for_isl_can_validate: false,

  // The actual schemas, embedded in a s-expression. Test runners must convert these s-expressions to a document.
  invalid_schemas: [
    (
      $ion_schema_2_0
      $ion_schema_1_0
      schema_header::{}
      type::{
        name: foo,
        type: int,
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      $ion_schema_2_0
      schema_header::{}
      type::{
        name: foo,
        type: int,
      }
      schema_footer::{}
    ),
  ]
}
```

#### `valid_schemas` Tests
A test case that checks that the given schema documents are correctly recognized as valid.
```ion
$test::{
  // A useful description of the test to aid with debugging, understanding the spec, etc.
  description: "Unreserved symbols should always be permitted as open content field names in a schema header",

  // Unlike `invalid_schemas` test cases, ISL for ISL cannot be skipped because ISL for ISL must always accept valid schemas.

  // The actual schemas, embedded in a s-expression. Test runners must convert these s-expressions to a document.
  valid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{ $lower_snake_case_with_a_leading_dollar_sign: 1 }
      schema_footer::{} 
    ),
    (
      $ion_schema_2_0
      schema_header::{ _lower_snake_case_with_a_leading_underscore: 2 }
      schema_footer::{}
    ),
  ],
}
```

#### `invalid_types` Tests
A parameterized test case that checks that multiple type definitions are correctly recognized as invalid.
Test runner implementations should append the zero-based index of the test case to the test description.
E.g. "Regex must be a string [1]"
```ion
$test::{
  // A useful description of the test to aid with debugging, understanding the spec, etc.
  description: "Regex must be a string",

  // Indicates that ISL for ISL cannot detect that this type as invalid. 
  // This is an optional field that indicates whether an ISL for ISL test runners should run this test case.
  // If the field is not present, it is assumed to be "true".
  isl_for_isl_can_validate: false,

  // A list of types that are invalid. They should be detected as invalid by both the Ion Schema implementation and
  // by the types defined in ion-schema-schemas, except as noted above.
  invalid_types: [
    { regex: 1 },
    { regex: false },
    { regex: [] },
    { regex: () },
  ]
}
```

General notes:
* The directory and file structure exists primarily for organizational purposes and is not relevant to successful execution of the tests (except for tests within the schema directory that rely on schema import functionality)
* Every test file should be a valid Ion Schema document (though it may be an empty schema if there are no types defined).
* Documents are represented as annotated _s-expressions_ for `should_accept_as_valid` and `should_reject_as_invalid`.
```ion
document::(
  
)
```

### ISL for a test case

Ion Schema type that defines a valid test case.

```ion
type::{
  name: ion_schema_test_case,
  annotations: closed::required::[$test],
  one_of: [
    {
      container_length: range::[2, 3],
      fields: closed::{
        type: { type: symbol, occurs: required },
        should_accept_as_valid: list,
        should_reject_as_invalid: list,
      },
    },
    {
      fields: closed::{
        description: { type: string, occurs: required },
        invalid_schemas: { type: list, occurs: required, element: sexp },
        isl_for_isl_can_validate: bool,
      }
    },
    {
      fields: closed::{
        description: { type: string, occurs: required },
        valid_schemas: { type: list, occurs: required, element: sexp },
      }
    },
    {
      fields: closed::{
        description: { type: string, occurs: required },
        invalid_types: { type: list, occurs: required },
        isl_for_isl_can_validate: bool,
      }
    },
  ]
}
```

## License

This project is licensed under the Apache-2.0 License.
