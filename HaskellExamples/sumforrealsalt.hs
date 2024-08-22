summy :: (Float -> Float) -> (Float -> Float)
summy afunction 0 = 0
summy afunction x = (afunction x) + summy afunction (x - 1)

square :: Float -> Float
square n = n*n

cube :: Float -> Float
cube n = n*n*n


pi_term :: Float -> Float
pi_term n = 4*((-1)^floor((n-1)))/(2*(n-1) + 1)
