type::{
  timestamp_precision: range::[min, day],
}
valid::[
  2000T,
  2000-01T,
  2000-01-01T,
]
invalid::[
  2000-01-01T00:00Z,
  2000-01-01T00:00:00Z,
]

type::{
  timestamp_precision: range::[day, max],
}
valid::[
  2000-01-01T,
  2000-01-01T00:00Z,
  2000-01-01T00:00:00Z,
]
invalid::[
  2000T,
  2000-01T,
]
