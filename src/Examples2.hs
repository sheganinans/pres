-- | Presentation 2
module Examples2 where

import Text.Parsec
import Data.Functor

data Op
  = Add
  | Sub
  | Mul
  | Div
  deriving (Eq, Ord, Show)

data Expr2
  = N Expr2 Op Expr2
  | D Double
  deriving (Show)

numberParser:: Parsec String st Double
numberParser = read <$> (many $ oneOf "0123456789")

operatorParser:: Parsec String st Op
operatorParser =
  chooseOp <$> (oneOf "+-*/") where
    chooseOp '+' = Add
    chooseOp '-' = Sub
    chooseOp '*' = Mul
    chooseOp '/' = Div
    chooseOp c   = error $ "Bad Parse: " ++ [c]

expressionParser:: Parsec String st Expr2
expressionParser
   =  between (char '(') (char ')') binaryExpressionParser
  <|> D <$> numberParser

binaryExpressionParser:: Parsec String st Expr2
binaryExpressionParser = N <$> expressionParser <*> operatorParser <*> expressionParser

test :: String -> Either ParseError Expr2
test = parse expressionParser ""

eval2 :: Expr2 -> Double
eval2 (D f) = f
eval2 (N a Add b) = eval2 a + eval2 b
eval2 (N a Sub b) = eval2 a - eval2 b
eval2 (N a Mul b) = eval2 a * eval2 b
eval2 (N a Div b) = eval2 a / eval2 b

fromRight :: Show l => Either l r -> r
fromRight (Right r) = r
fromRight (Left l)  = error $ show l

runLang :: String -> IO ()
runLang = print . eval2 . fromRight . test

testLang :: IO ()
testLang = do
  putStrLn "Some tests"
  runLang "(5/(2+1))"
  runLang "(4+(1/5))"
  runLang "(1423/(4+(7/(1+4))))"
  runLang "(6/(2+5))"
