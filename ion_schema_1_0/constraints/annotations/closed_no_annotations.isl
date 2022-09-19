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
  // Note that this is interpreted by the test runner as a document rather than a string that is annotated with document.
  document::'''
    foo
    bar
    baz
  '''
]

