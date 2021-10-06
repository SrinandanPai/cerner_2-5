// cerner_2tothe5th_2021
//
// Program to encrypt a text using Vernam/One-Time Pad Cipher
// Vernam Cipher: https://www.geeksforgeeks.org/vernam-cipher-in-cryptography/

fun encryptText(text: String, key: String) {
    if(text.length > key.length) {
        println("The length of the key should be greater than or equal to the length of the text")
    }

    var encryptedText = ""
    for(index in text.indices) {
        var textChar = text.elementAt(index)
        var shift = textChar.toInt()
        when {
            textChar.isLetter() -> {
                var keyChar = key.elementAt(index)
                shift += keyChar.toInt() - if (keyChar.isUpperCase()) 65 else 97

                if (textChar.isUpperCase() && shift > 90) shift = (shift % 90) + 64
                else if (textChar.isLowerCase() && shift > 122) shift = (shift % 122) + 96
            }
        }
        encryptedText += shift.toChar()
    }
    println(encryptedText)
}

fun main() {
    encryptText("EngineeringCollaboration", "CernertwotothefiveContest")
}
