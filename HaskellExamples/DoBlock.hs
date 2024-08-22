main = do 
  {x <- getDouble;
   y <- getDouble;
   print (x+y);
   }

getDouble :: IO Double
getDouble = readLn