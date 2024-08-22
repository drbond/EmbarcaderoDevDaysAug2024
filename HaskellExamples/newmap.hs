map' f [] = []
map' f (x:xs) = f x : map' f xs
double x = 2 * x 