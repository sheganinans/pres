-- | Examples for the first lecture. "Getting Started"
module Examples where


{-

public static long recFibN(final int n)
{
 return (n < 2) ? n : recFibN(n - 1) + recFibN(n - 2);
}


function fib(n) {
  return function(n,a,b) {
    return n>0 ? arguments.callee(n-1,b,a+b) : a;
  }(n,0,1);
}


var fib = (function(cache){                        //ECMAScript can "memoize" too, you know!
    return cache = cache || {}, function(n){
        if (cache[n]) return cache[n];
        else return cache[n] = n == 0 ? 0 : n < 0 ? -fib(-n)
            : n <= 2 ? 1 : fib(n-2) + fib(n-1);
    };
})();

-}

fibs :: [Integer]
fibs = 0 : scanl (+) 1 fibs


{-

function factorial(n) {
    return n < 2 ? 1 : n * factorial(n - 1);
}


function factorial(n) {
    var x = 1;
    for (var i = 2; i <= n; i++) {
        x *= i;
    }
    return x;
}


public static long fact(final int n) {
    if (n < 0){
        System.err.println("No negative numbers");
        return 0;
    }
    return (n < 2) ? 1 : n * fact(n - 1);
}


public static long fact(final int n) {
    if (n < 0) {
        System.err.println("No negative numbers");
        return 0;
    }
    long ans = 1;
    for (int i = 1; i <= n; i++) {
        ans *= i;
    }
    return ans;
}

-}

factorial :: (Enum a, Num a) => a -> a
factorial n = product [1..n]


{-

function gcd(a,b) {
    if (a < 0) a = -a;
    if (b < 0) b = -b;
    if (b > a) {var temp = a; a = b; b = temp;}
    while (true) {
        a %= b;
        if (a == 0) return b;
        b %= a;
        if (b == 0) return a;
    }
}



function gcd_rec(a, b) {
    if (b) {
        return gcd_rec(b, a % b);
    } else {
        return Math.abs(a);
    }
}



public static long gcd(long a, long b){
   long factor= Math.max(a, b);
   for(long loop= factor;loop > 1;loop--){
      if(a % loop == 0 && b % loop == 0){
         return loop;
      }
   }
   return 1;
}


import java.math.BigInteger;

public static long gcd(long a, long b){
   return BigInteger.valueOf(a).gcd(BigInteger.valueOf(b)).longValue();
}
-}

gcd' :: Integral a => a -> a -> a
gcd' a 0  =  a
gcd' a b  =  gcd' b (a `rem` b)


{-

function ack(m, n) {
 return m === 0 ? n + 1 : ack(m - 1, n === 0  ? 1 : ack(m, n - 1));
}


import java.math.BigInteger;  // This is the only impl that doesn't crash with an integer overflow. :\

public static BigInteger ack(BigInteger m, BigInteger n) {
    return m.equals(BigInteger.ZERO)
            ? n.add(BigInteger.ONE)
            : ack(m.subtract(BigInteger.ONE),
                        n.equals(BigInteger.ZERO) ? BigInteger.ONE : ack(m, n.subtract(BigInteger.ONE)));
}

-}

ack :: (Eq a, Eq b, Num a, Num b) => a -> b -> b
ack 0 n = n + 1
ack m 0 = ack (m-1) 1
ack m n = ack (m-1) (ack m (n-1))

findRoots :: (Double -> Double) -> [Double]
findRoots f = findRoots' f (-1.0) 3.0 0.0001 0.000000001

findRoots' :: (Enum t, Num t, Num a, Ord a) => (t -> a) -> t -> t -> t -> a -> [t]
findRoots' f start stop step eps =
    [x | x <- [start, start+step .. stop], abs (f x) < eps]

integrate :: (Enum a, Fractional a) => (a -> a) -> a -> a -> a
integrate f s e = go s e 10000 where
  go a b n = sum $ map g [0..n - 1] where
    h = (b - a) / n
    x n = a + n * h                                         -- These three lines are not in good style, shadows n.
    g n  = h * simp (f $ x n) (f $ x n + h/2) (f $ x n + h) -- But done for the sake of keeping in line with literature.
    simp l m h = (l + 4 * m + h) / 6                        -- h shadowed.

something, square, cube :: Num a => a -> a
something  x = x^3-3*x^2+2*x
square     x = x * x
cube       x = x * x * x

type RobotProgram = [RobotCommand]

data RobotCommand
  = Rotate Socket Int
  | Pinch Hand
  | Release Hand
  deriving (Read, Show)

data Socket
  = Socket1
  | Socket2
  | Socket3
  deriving (Read, Show)

data Hand
  = Hand1
  | Hand2
  deriving (Read, Show)

runRobotExample :: IO ()
runRobotExample = do
  file <- readFile "./one.rbt"
  evalR file

evalR :: String -> IO ()
evalR s = mapM_ runRobot l where
  l = map read $ lines s
  runRobot = putStrLn . go where
    go (Rotate s i) = "Rotating socket: " ++ show s ++ " by " ++ show i ++ "!"
    go (Pinch h)    = "Pinching hand: " ++ show h ++  "!"
    go (Release h)  = "Releasing hand: " ++ show h ++ "!"

data Expr
  = I Double
  | Expr :+: Expr
  | Expr :-: Expr
  | Expr :*: Expr
  | Expr :/: Expr

evalC :: Expr -> Double
evalC (I i) = i
evalC (a :+: b) = evalC a + evalC b
evalC (a :-: b) = evalC a - evalC b
evalC (a :*: b) = evalC a * evalC b
evalC (a :/: b) = evalC a / evalC b
