type::{
  annotations: [a, b, c, d],
}
valid::[
  5,
  a::5,
  b::5,
  c::5,
  d::5,
  a::b::c::d::5,
  d::c::b::a::5,
  open_content::a::open_content::b::open_content::c::open_content::d::open_content::5,
]

invalid::[
  // Note that this is interpreted by the test runner as a document rather than a string that is annotated with document.
  document::'''
    foo
    bar
    baz
  '''
]

