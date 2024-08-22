minfree :: [Nat] -> Nat
minfree xs = head([0..]\\xs)

us\\vs = filter (member vs) us
