test always_true() {
  True
}

test basic_addition() {
  2 + 2 == 4
}

// Boolean test
test bool_test() {
  let x = True
  let y = False
  x && !y
}

// Integer test
test int_test() {
  let x = 10
  let y = 5
  x > y
}

// String test
test string_test() {
  let greeting = @"Hello"
  greeting == @"Hello"
}
