$ion_schema_2_0

type::{
  name: only_vowels,
  regex: "^[aeiouAEIOU]*$"
}

type::{
  name: annotations_with_regex,
  annotations: { element: only_vowels },
}

$test::{
  type: annotations_with_regex,
  should_accept_as_valid: [
    0,
    ''::0,
    a::1,
    aaiie::2.0,
    OieAiU::Eiie::3e0,
    a::e::i::o::u::A::E::I::O::U::'4',
  ],
  should_reject_as_invalid: [
    abc::1,
    a::b::2,
    $a::3,
    _e::4,
    '🥧'::5
  ],
}

type::{
  // Important use case—exactly N annotations allowed
  name: exactly_n_annotations_allowed,
  annotations: { container_length: 1 },
}

$test::{
  type: exactly_n_annotations_allowed,
  should_accept_as_valid: [
    a::0,
    $b::1,
    _c::2,
    '🥧'::3,
    ''::4
  ],
  should_reject_as_invalid: [
    1,
    a::a::2,
    a::b::2,
  ],
}

$test::{
  description: "annotations argument must be a type reference",
  invalid_types: [
    { annotations: null },
    { annotations: (foo bar) },
    { annotations: "foo" },
  ]
}

$test::{
  description: "annotations argument type must exist",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { annotations: some_non_existent_type },
  ]
}

$test::{
  description: "annotations argument must not be a variably occurring type reference",
  invalid_types: [
    { annotations: { occurs: optional } },
  ]
}

$test::{
  description: "annotations argument must not define a type name",
  invalid_types: [
    { annotations: { name: foo } },
  ]
}
