addxyz :: Integer -> (Integer -> (Integer -> Integer))
addxyz x y z = x + y + z

add2yz :: Integer -> (Integer -> Integer)
add2yz y z = 2 + y + z

add23z :: Integer -> Integer
add23z z = 2 + 3 + z
