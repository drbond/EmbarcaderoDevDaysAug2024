fac :: Integer -> Integer
fac 0 = 1
fac n = n * fac (n - 1)

square :: Integer -> Integer
square x = x*x*x
