$ion_schema_1_0
$test::{
  description: "timestamp_precision must be a timestamp precision value or range",
  invalid_types: [
    { timestamp_precision: null },
    { timestamp_precision: null.symbol },
    { timestamp_precision: null.list },
    { timestamp_precision: 5 },
    { timestamp_precision: min },
    { timestamp_precision: max },
    { timestamp_precision: [year, second] },
  ]
}

$test::{
  description: "timestamp_precision range - wrong # of elements in list",
  invalid_types: [
    { timestamp_precision: range::[year] },
    { timestamp_precision: range::[year, second, nanosecond] },
  ]
}

$test::{
  description: "timestamp_precision range - lower > upper",
  invalid_types: [
    { timestamp_precision: range::[max, min] },
    { timestamp_precision: range::[year, min] },
    { timestamp_precision: range::[max, nanosecond] },
    { timestamp_precision: range::[month, year] },
    { timestamp_precision: range::[day, month] },
    { timestamp_precision: range::[minute, day] },
    { timestamp_precision: range::[second, minute] },
    { timestamp_precision: range::[millisecond, second] },
    { timestamp_precision: range::[microsecond, millisecond] },
    { timestamp_precision: range::[nanosecond, microsecond] },
  ]
}

$test::{
  description: "timestamp_precision range - empty range",
  invalid_types: [
    { timestamp_precision: range::[exclusive::day, exclusive::day] }
  ]
}
