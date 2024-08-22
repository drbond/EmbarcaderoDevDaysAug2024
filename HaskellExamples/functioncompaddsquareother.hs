add :: Integer -> Integer -> Integer
add x y = x + y

square :: Integer -> Integer
square z = z*z

fcomposition :: (Integer -> Integer -> Integer) -> (Integer -> Integer) -> Integer -> Integer -> Integer
fcomposition g f x y = g (f x) (f y)

double :: Integer -> Integer
double w = 2*w
