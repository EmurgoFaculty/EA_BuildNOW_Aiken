
//// 1. High Order functions
//// As other functional languages, Aiken has first-class functions. This means that functions can be passed as arguments to other functions, returned as values from other functions, and assigned to variables.


fn twice(f: fn(t) -> t, x: t) -> t {
  f(f(x))
}

fn add_two(x: Int) -> Int {
  x + 2
}

test add_two_test() {
  twice(add_two, 3) == 7
}

fn select_function(x: Int) -> fn(Int) -> Int {
  if x > 0 {
    add_two
  } else {
    sub_two
  }
}

fn sub_two(x: Int) -> Int {
  x - 2
}

test select_function_test() {
  select_function(1)(3) == 5 && select_function(-1)(3) == 1
}

test assign_function_test() {
  let f: fn(Int) -> Int = select_function(1)
  let g: fn(Int) -> Int = select_function(-1)


  f(3) == 5 && g(3) == 1
}
// map-filter-fold
