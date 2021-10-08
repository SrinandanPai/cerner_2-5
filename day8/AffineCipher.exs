# cerner_2tothe5th_2021
# Program to encrypt a text using Affine Cipher
# Affine Cipher: http://www.programming-algorithms.net/article/40729/Affine-cipher
# How to run?
# Run 'elixir AffineCipher.exs'

defmodule AffineCipher do
    def encryptText(text, keyA, keyB) do
        textCharList = to_charlist(text)
        Enum.map(textCharList, fn(textChar) ->  encrypt(textChar, keyA, keyB)  end)
    end

    def encrypt(char, keyA, keyB) do
        offset = cond do
            (char > 64 && char < 91) -> 65
            (char > 96 && char < 123) -> 97
            true -> 0
        end

        cond do
            (char > 64 && char < 91) || (char > 96 && char < 123) -> 
                rem((((char - offset) * keyA) + keyB), 26) + offset
            true -> char
        end 
    end
end

text = "Engineering Collaboration"
keyA = 5
keyB = 2
IO.puts("Encrypted Text of '#{text}': #{AffineCipher.encryptText(text, keyA, keyB)}")
