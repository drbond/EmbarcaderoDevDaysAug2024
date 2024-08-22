summy :: (Integer -> Integer) -> (Integer -> Integer)
summy afunction 0 = 0
summy afunction x = (afunction x) + summy afunction (x - 1)

square :: Integer -> Integer
square n = n*n

cube :: Integer -> Integer
cube n = n*n*n

identity :: Integer -> Integer
identity n = n