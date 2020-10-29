type::{
  annotations: closed::[],
}
valid::[
  5,
  "I love Ion Schema",
  [ a::5, b::5 ],
]
invalid::[
  a::5,
  b::"I love Ion Schema",
  c::[ a::5, b::5 ],
  'null'::"Foo",
]

