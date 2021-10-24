// cerner_2tothe5th_2021
// Print the factorial of the number of days left

class Factorial {
    static recursive(num) {
        if (num < 2) return 1
        return num * recursive(num-1)
    }
}
System.print("Factorial(8):  %(Factorial.recursive(8))")
