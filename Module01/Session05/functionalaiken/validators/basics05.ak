//// Constants and Types

// ## Ints


pub const pi: Int = 314159265359

pub fn circle_area(radius: Int) -> Int {
  pi * radius * radius
}

pub fn circle_circumference(radius: Int) -> Int {
  2 * pi * radius
}

// ## Bools

pub const failed_answer: Bool = False


pub fn da_question(da_answer: Bool) -> Bool {
  if da_answer {
    True
  } else {
    failed_answer
  }
}

// ## ByteArray


pub fn even_or_odd_if(x: Int) -> ByteArray {
  if x % 2 == 0 {
    "even"
  } else {
    "odd"
  }
}

// ## Lists


pub const list_of_tokens = ["Sundae", "Meld", "Iagon", "Minswap"]

pub const tokesn_n_ada = ["Ada", ..list_of_tokens]

// ## Tuples

pub const my_mega_super_tuple = (1, "two", 3)

pub const just_a_tuple = (5, "six")

// ## Pairs

// pub const value = Pair("Sundae", 100)

// ## Tests

test area_test_set4() {

  circleArea(10) == 31415926535900
}

test circumference_test_set4() {
  circleCircumference(10) == 6283185307180

}
