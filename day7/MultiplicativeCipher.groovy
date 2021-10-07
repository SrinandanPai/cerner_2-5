// cerner_2tothe5th_2021
//
// Program to encrypt a text using Multiplicative Cipher
//
// How to run?
// Run 'groovy MultiplicativeCipher.groovy "Engineering Collaboration" 32'
//
// Multiplicative Cipher: https://www.tutorialspoint.com/cryptography_with_python/cryptography_with_python_multiplicative_cipher.htm

class MultiplicativeCipher {
    static String encryptText(String text, int shift) {
        String encryptedText = ''
        int offset

        for (char textChar in text) {
            int charShift = textChar
            if (textChar.letter) {
                if (textChar.upperCase) {
                    offset = 'A'
                } else {
                    offset = 'a'
                }

                charShift = ((charShift - offset) * shift) % 26 + offset
            }

            encryptedText += (char) charShift
        }

        return encryptedText
    }

    static void main(String[] args) {
        println(MultiplicativeCipher.encryptText(args[0], args[1].toInteger()))
    }
}
