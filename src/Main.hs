import Happstack.Server
import Control.Monad
import Data.List.Split (splitOn)
import Data.List (intercalate)

main :: IO ()
main = simpleHTTP nullConf $ msum
  [ dir "rpn" $ runSolver ]

runSolver :: ServerPartT IO Response
runSolver = uriRest (\p -> ok $ (toResponse . show . solveRPN) (fixPath p))
  where fixPath = intercalate " " . splitOn "/"

-- 10 4 3 + 2 * -
-- 10 - (4 + 3) * 2
-- -4
solveRPN :: String -> Float
solveRPN = head . foldl foldingFunction [] . words
  where foldingFunction (x:y:restOfStack) "+" = (y+x):restOfStack
        foldingFunction (x:y:restOfStack) "-" = (y-x):restOfStack
        foldingFunction (x:y:restOfStack) "*" = (y*x):restOfStack
        foldingFunction stack number = read number:stack

