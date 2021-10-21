# cerner_2tothe5th_2021
# Program to print the fibanacci of a given number

proc Fibonacci(num: int): int64 =
  if num <= 2:
    result = 1
  else:
    result = Fibonacci(num- 1) + Fibonacci(num - 2)

echo Fibonacci(32)
