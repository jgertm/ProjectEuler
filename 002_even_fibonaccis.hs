-- Each new term in the Fibonacci sequence is generated by adding
-- the previous two terms. By starting with 1 and 2, the first 10 terms 
-- will be:
-- 
-- 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
-- 
-- By considering the terms in the Fibonacci sequence whose values do not exceed
-- four million, find the sum of the even-valued terms.

fibonacci :: (Integral a) => a -> a
fibonacci 1 = 1
fibonacci 2 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

listEvenFibonaccisToIndex :: (Integral a) => a -> [a]
listEvenFibonaccisToIndex n = [x | x <- (map fibonacci [1..n]), even x]

listEvenFibonaccisToValue :: (Integral a) => a -> [a]
listEvenFibonaccisToValue n = listEvenFibonaccisToValue' n [1] 2

listEvenFibonaccisToValue' :: (Integral a) => a -> [a] -> a -> [a]
listEvenFibonaccisToValue' n (x:xs) index
	| x > n = [y | y <- xs, even y]
	| otherwise = listEvenFibonaccisToValue' n ((fibonacci index):x:xs) (index + 1)
	
sumEvenFibonaccisToValue :: (Integral a) => a -> a
sumEvenFibonaccisToValue n = sum (listEvenFibonaccisToValue n)

main :: IO()
main = print $ sumEvenFibonaccisToValue 4000000