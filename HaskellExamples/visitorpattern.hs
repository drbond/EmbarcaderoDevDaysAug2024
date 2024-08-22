data Shape = Circle { x :: Double, y :: Double, r :: Double }
           | Rectangle { x0 :: Double, y0 :: Double, x1 :: Double, y1 :: Double }

class ShapeVisitor v where
  visitCircle :: v -> Shape -> IO ()
  visitRectangle :: v -> Shape -> IO ()

instance ShapeVisitor (Shape -> IO ()) where
  visitCircle f shape@(Circle _ _ _) = f shape
  visitRectangle f shape@(Rectangle _ _ _ _) = f shape

accept :: (ShapeVisitor v) => v -> Shape -> IO ()
accept visitor shape@(Circle _ _ _) = visitCircle visitor shape
accept visitor shape@(Rectangle _ _ _ _) = visitRectangle visitor shape

main :: IO ()
main = do
  let circle = Circle 2.0 1.4 4.5
  let rectangle = Rectangle 1.3 3.1 10.3 7.7
  accept print circle
  accept print rectangle