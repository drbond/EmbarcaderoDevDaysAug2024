When we're programming in Haskell and we want to do something that has a side effect, something that affects the world in some way, we use actions. Actions are values in the Haskell language, much like the number three, the string "hello world", or the function map. They can be bound to variable names, passed into a function as an argument or be the result of a function. Like all other Haskell values, every action has a type. There are many kinds of actions but we'll start with a very important one called an IO action. These are the actions that can change the world outside of the program. Here are some examples of IO actions: 

module Main where

main :: IO ()
main = putStrLn "hello"

putStrLn :: String -> IO ()

main :: IO ()
main = do
    putStrLn "hello"
    putStrLn "world"

main:: IO ()
main = do
    line <- getLine                                     -- line :: String
    putStrLn ("you said: " ++ line)