append :: a ->[a] -> [a]

append y (x:xs) = reverse( y : reverse(x:xs))
