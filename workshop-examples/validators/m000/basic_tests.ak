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

//TRACE MESSAGES
test with_trace() {
  trace @"Starting test"
  let result = 5 * 5
  trace @"Calculation complete"
  result == 25
}

test trace_values() {
  let x = 100
  trace @"Value of x"
  x == 100
}
