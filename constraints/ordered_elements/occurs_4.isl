type::{
  ordered_elements:[
    { type: int, occurs: optional },
    { type: number, occurs: optional },
    { type: any, occurs: required}
  ]
}

valid::[
  [1],
  [1, 2],
  [1, 2, 3],
  [1, 2.0],
  [1, foo],
  [1.0, foo],
  [1, 1.0, foo],
]

invalid::[
  [1, 2, 3, 4],
  [1, foo, foo],
]
