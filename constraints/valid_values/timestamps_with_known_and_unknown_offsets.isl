type::{
  valid_values: [
    // Ranges and single values are intentionally mixed to help prevent faulty
    // logic that relies on ranges being before single values or vice versa.
    2022T,
    range::[2020-01-01T00:00Z, 2025-01-01T00:00Z],
    2023T,
    range::[2030-01-01T00:00Z, 2035-01-01T00:00Z],
    2000T,
  ],
}
valid::[
  2022T,
  2023T,
  2000T,
  2022-01-05T00:00:00Z
]
invalid::[
  1995T,
  2020T,
  2021T,
  2022-01T,
  2022-01-05T00:00:00-00:00
]
