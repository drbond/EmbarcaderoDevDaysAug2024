summy :: (Float -> Float) -> (Float -> Float)
summy afunction 0 = 0
summy afunction x = (afunction x) + summy afunction (x - 1)

square :: Float -> Float
square n = n*n

cube :: Float -> Float
cube n = n*n*n


pi_term :: Float -> Float
pi_term n = 8/((4*n-3)*(4*n-1))
