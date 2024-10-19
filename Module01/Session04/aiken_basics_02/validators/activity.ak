
fn evenornot(x: Int) -> Bool{
    x%2 ==0 
}



fn evenornotpattern(x: Int) -> Bool {
    when x%2 is {
        0  -> True
        _ -> False

    }
}  


fn compare (price: Int, payment: Int) -> Bool{
    if (payment >= price)
    {
        True
    }
    else {
        False
    }
}




test evenornotpattern_test() {
    evenornotpattern(4) == True    
    
}

test evenornotpattern_test2() {
    evenornotpattern(5) == False    
    
}



test evenornot_test() {
    evenornot(4) == True    
    
}

test evenornot_test2() {
    evenornot(5) == False    
    
}


test compare_test() {
    compare(4, 5) == True    
    
}

