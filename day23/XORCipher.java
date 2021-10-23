// cerner_2tothe5th_2021
//
// Program to encrypt a text using XOR Cipher
// XOR Cipher: https://www.tutorialspoint.com/cryptography_with_python/cryptography_with_python_xor_process.htm

import java.util.Base64;
import java.nio.charset.StandardCharsets;
import java.io.UnsupportedEncodingException;

class XORCipher {
  static String encryptText(String text, String key) {
    try {
      String encryptedText = "";

      for (int index = 0; index < text.length(); index++) {
        encryptedText = encryptedText + Character
            .toString((char) text.charAt(index) ^ key.charAt(index % key.length()));
      }
      return Base64.getEncoder()
          .encodeToString(encryptedText.getBytes(StandardCharsets.UTF_8.toString()));
    } catch (UnsupportedEncodingException exception) {
      throw new RuntimeException(exception);
    }
  }

  public static void main(String[] args) {
    System.out.println("Encrypted String: " + encryptText(args[0], args[1]));
  }
}
