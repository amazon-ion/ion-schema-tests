// Ranges: https://amzn.github.io/ion-schema/docs/spec.html#constraints
// For more information on valid_values: https://amzn.github.io/ion-schema/docs/spec.html#valid_values
type::{
  type: decimal,
  valid_values: [
    range::[-20d0, -10d0],
    0d0,
    range::[10d0, exclusive::20d0]
  ]
}
valid::[
    -20d0,
    -15d0,
    -10d0,
    0d0,
    10d0,
    15d0,
]
invalid::[
    -25d0,
    -5d0,
    5d0,
    25d0,
    20d0
]