// cerner_2tothe5th_2021
//
// Program to encrypt a text using ROT13 Cipher
//
// How to run?
// Run 'scala ROT13Cipher.scala' from the terminal

object ROT13Cipher {
  private def encrypt(text: String): String = {
    val Shift = 13
    var encryptedText: String = ""
    text
        .foreach(c => {
          var afterShift: Int = c.toInt
          if (c.isLetter) {
            afterShift += Shift

            if (c.isUpper && afterShift > 90) afterShift = (afterShift % 90) + 64
            else if (c.isLower && afterShift > 122) afterShift = (afterShift % 122) + 96
          }
          encryptedText += afterShift.toChar
        })
    encryptedText
  }

  def main(args: Array[String]): Unit = {
    // Run and check the value printed out for "Ratvarrevat Pbyynobengvba"
    println(encrypt("Ratvarrevat Pbyynobengvba"))
  }
}
