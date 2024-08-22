maxy :: (Ord a)=>[a] -> a
maxy [] = error "no maximum of empty list!"
maxy [x] = x
maxy (x:xs) = max x (maxy xs)
