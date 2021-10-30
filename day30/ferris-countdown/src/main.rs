// cerner_2tothe5th_2021
// Ferris's Countdown
// Ref: https://www.rust-lang.org/learn/get-started

use ferris_says::say;
use std::io::{stdout, BufWriter};

fn main() {
    let stdout = stdout();
    let message = String::from("Cerner 2^5 2021\n3 days left!!!");
    let width = message.chars().count();

    let mut writer = BufWriter::new(stdout.lock());
    say(message.as_bytes(), width, &mut writer).unwrap();
}
