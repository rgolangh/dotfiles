#!/usr/bin/env -S /home/rgolan/.cargo/bin/cargo -Zscript
//Excercise in rust (while using new cargo single file package feature)
fn main() {
    foo();
    println!("Printing a-z A-Z as \"A\" | \"B\" ...  (Backus–Naur form)");
    for (i, c) in  ('A'..'Z').chain('a'..'z').enumerate() {
        let new_line = if (i+1) % 10 == 0  { "\n" } else {""};
        print!("\"{}\" |{new_line}", c);
    }

    let a: i8 = 4;
    print!(a);
}

// foo those this 
// a: an int
fn foo(a: i8) {
    print!(a)
}
