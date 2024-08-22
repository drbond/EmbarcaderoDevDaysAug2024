{-# LANGUAGE ForeignFunctionInterface #-}

module Visitorlib where

import Foreign.C.Types
import Foreign.C.String

-- Exported function for visiting ElementA
foreign export ccall visitElementA :: CString -> IO ()

visitElementA :: CString -> IO ()
visitElementA _ = putStrLn "Haskell: Visiting Element A"

-- Exported function for visiting ElementB
foreign export ccall visitElementB :: CString -> IO ()

visitElementB :: CString -> IO ()
visitElementB _ = putStrLn "Haskell: Visiting Element B"
