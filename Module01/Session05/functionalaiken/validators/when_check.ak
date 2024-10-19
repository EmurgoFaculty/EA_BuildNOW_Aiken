type Datum {
  id: Option<Int>,
  name: ByteArray,
}

test main() {
  let datum = Datum { id: Some(-5), name: "Narayan" }
  trace datum.name
  //Need to create a switch like statement
  when datum.id is {
    None -> False
    Some(-5) -> True
    Some(x) ->
      when Some(x) is {
        Some(3) -> True
        _ -> False
      }
  }
}

test test_main() {
  main() == True
}
