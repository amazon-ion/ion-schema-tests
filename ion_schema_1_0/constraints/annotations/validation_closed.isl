type::{
  annotations: closed::[a, b, c],
}
test_validation::{
  value: d::5,
  violations: [
    {
      constraint: { annotations: closed::[a, b, c] },
      code: unexpected_annotation,
    },
  ],
}

