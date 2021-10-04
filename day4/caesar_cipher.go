// cerner_2tothe5th_2021
// Program to encrypt a text using Caesar Cipher

package main

import (
	"fmt"
	"strings"
	"unicode"
)

func caesarCipher(text string, shift int) string {
	return strings.Map(func(char rune) rune {
		if (unicode.IsUpper(char)) {
			return rune((int(char) + shift - 65) % 26 + 65)
		} else {
			return rune((int(char) + shift - 97) % 26 + 97)
		}
	}, text)
}

func main() {
	text := "EngineeringCollaboration"
	shift := 4

	// Text -> Caesar Cipher -> Encrypted Text
	fmt.Println(text, "->", caesarCipher(text, shift))
}
