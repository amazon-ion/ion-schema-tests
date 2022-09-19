// Ranges: https://amzn.github.io/ion-schema/docs/spec.html#constraints
// For more information on valid_values: https://amzn.github.io/ion-schema/docs/spec.html#valid_values
type::{
  valid_values:[
    range::[0, 9],
    range::[10d0, 19d0],
    range::[20e0, 29e0],
  ]
}
valid::[
    0,
    7,
    7.5,
    9,
    10d0,
    15d0,
    19d0,
    20e0,
    25e0,
    29e0,
]
invalid::[
    30,
    30e0,
    30d0
]