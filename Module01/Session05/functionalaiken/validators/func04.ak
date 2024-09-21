// Pipelines - Aiken's function composition.

use aiken/collection/list.{drop, take}

// With parenthesis nesting
fn just_Joe() -> List<ByteArray> {
  take(drop(["H","e","l","l","o"," ","J","o","e","!"],6),3)
}


// With pipelines
fn just_Mike() -> List<ByteArray> {
  ["H","e","l","l","o"," ","M","i","k","e","!"]
    |> drop(_,6)
    |> take(_,4)
}

test  test_just_Joe() {
    just_Joe() == ["J","o","e"]
}

test test_just_Mike() {
    just_Mike() == ["M","i","k","e"]
}
