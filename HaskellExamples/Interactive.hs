main :: IO ()
main = do putStrLn "What is your first name? "
          first <- getLine
          putStrLn "And your last name? "
          last <- getLine
          let full = first ++ " " ++ last
          putStrLn ("Pleased to meet you, " ++ full ++ "!")