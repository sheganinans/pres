# What is this?

This is the code and slides for my talks "Introduction to Functional Programming in Haskell pt. 1-3".


# Slides

https://docs.google.com/presentation/d/1a-OIimqSYeuYCPIx3_UogtBzxgD5IkxOmjMXUx6GAO4/edit?usp=sharing

https://docs.google.com/presentation/d/1f2xI7YJsDoCC4wi2fZF79n6mYkqGaVKB0Z9Vu43jifQ/edit?usp=sharing

https://docs.google.com/presentation/d/1By0-aIrhA9VH9rs9kUVzXuXuw7gDvzztXkjL9Nt6PqM/edit?usp=sharing

# Videos

https://youtu.be/me_KkQfSFrQ

# How to use this thing

```bash
cd /dir/to/project
cabal sandbox init
cabal install --only-dependencies
cabal repl
```

# Now try some things!

Things to try:

```haskell
integrate cube 0 1
integrate something (-30) 20
runRobotExample
evalC $ I 1 :+: (I 1 :/: I 3)
testLang
```

# Notes for video 1:

## Extra credit:

Remember when I told you to don't worry about mapM_ in my robot eval? Take a look at it in ghci with :t, take a look at mapM too. mapM_ is exactly like mapM, but it "throws away" it's return value, giving a "m ()" instead of a "m [b]".

### To some this maybe evidence that Haskell is inferior in it's expressibility.

Needing the additional functions to express mapping with an monadic function. As some dynamic language enthusiasts may argue.

I say nay, this is actually a sign of Haskell's expressivity. We are faced with the issue of mixing computations with an explicit context, such as IO, parsing, evaluating, etc. and those without. If we want to be honest about the fact that our function is dependent on this context that may change, we should carry that explicitly in our types. This gives us the advantage that we know which pieces of code require this context and which ones do not. We are able to say more about our code, not less.

# An additional note:

One thing I should have mentioned is information flow security. The idea is that you tag a piece of data as private, then ghc reject any code at compile time that leaks information because only the code with the public type can be shown to the outside world. This means that the only way to get code to compile that leaks sensitive information is to coerce the types, implying malicious intent.

These are two (out of quite a few) of the libraries that implement it:

http://hackage.haskell.org/package/lio

http://hackage.haskell.org/package/seclib

# Links!

Way more out there than listed here, the Haskell package repo, Hackage. Check out: http://hackage.haskell.org/packages/


## Epic Data Dump

http://dev.stephendiehl.com/hask/


## Articles I may have mentioned or thought you should see

https://wiki.haskell.org/Keywords

http://exple.tive.org/blarg/2013/10/22/citation-needed/

http://bitemyapp.com/posts/2014-04-29-meditations-on-learning-haskell.html

http://fsharpforfunandprofit.com/posts/ten-reasons-not-to-use-a-functional-programming-language/

http://www.norvig.com/design-patterns/design-patterns.pdf

https://jakevdp.github.io/blog/2014/05/09/why-python-is-slow/

http://scienceblogs.com/goodmath/2006/11/02/the-c-is-efficient-language-fa/

https://wiki.haskell.org/What_a_Monad_is_not

https://wiki.haskell.org/Typeclassopedia

http://yager.io/programming/go.html

http://blog.memsql.com/cache-is-the-new-ram/

http://www.reddit.com/r/haskell/comments/2qxcmz/ghc_illustrated_pdf/

https://www.fpcomplete.com/school/advanced-haskell/beautiful-concurrency

https://donsbot.wordpress.com/2008/05/06/write-haskell-as-fast-as-c-exploiting-strictness-laziness-and-recursion/

http://rosettacode.org

http://www.well-typed.com/blog/86/

http://johantibell.com/files/haskell-performance-patterns.html

https://wiki.haskell.org/Performance

http://aosabook.org/en/posa/warp.html

https://chris-taylor.github.io/blog/2013/02/10/the-algebra-of-algebraic-data-types/

https://www.fpcomplete.com/school/starting-with-haskell/libraries-and-frameworks/text-manipulation/attoparsec

http://hackage.haskell.org/package/pipes-4.1.0/docs/Pipes-Tutorial.html

http://blog.skillsmatter.com/2014/04/15/guest-post-haskell-gets-static-typing-right-andres-loh/

https://intoverflow.wordpress.com/2010/06/30/haskell-features-id-like-to-see-in-other-languages/

https://news.ycombinator.com/item?id=6116541

http://yannesposito.com/Scratch/en/blog/Haskell-the-Hard-Way/

https://wiki.haskell.org/Category:Tutorials

https://www.fpcomplete.com/user/snoyberg/library-documentation/conduit-overview

https://wiki.haskell.org/Category:Tools

https://wiki.haskell.org/Category:Theoretical_foundations

http://web.cs.wpi.edu/~jshutt/kernel.html

https://wiki.haskell.org/H-99:_Ninety-Nine_Haskell_Problems

http://conal.net/blog/posts/everything-is-a-function-in-haskell

http://stackoverflow.com/questions/1012573/getting-started-with-haskell

http://lukeplant.me.uk/blog/posts/why-learning-haskell-python-makes-you-a-worse-programmer/

https://github.com/bitemyapp/learnhaskell

https://wiki.haskell.org/Learning_Haskell

https://wiki.haskell.org/Blog_articles/Exercises

http://dev.stephendiehl.com/fun/

https://gist.github.com/chrisdone/0075a16b32bfd4f62b7b

http://h2.jaguarpaw.co.uk/

http://hyperpolyglot.org/

https://izbicki.me/blog/gausian-distributions-are-monoids

http://redmonk.com/sogrady/2015/01/14/language-rankings-1-15/

http://docs.spring.io/spring-framework/docs/2.5.x/api/org/springframework/aop/framework/AbstractSingletonProxyFactoryBean.html


## Books

http://learnyouahaskell.com/

http://book.realworldhaskell.org/read/

http://chimera.labs.oreilly.com/books/1230000000929/index.html

http://en.wikibooks.org/wiki/Haskell


## Nice Haskell interfaces/IDE

https://github.com/leksah/leksah

https://github.com/gibiansky/IHaskell

https://wiki.haskell.org/IDEs


## Web libraries
https://github.com/bos/aeson

https://github.com/egonSchiele/HandsomeSoup

https://github.com/jaspervdj/websockets

https://github.com/silkapp/rest

https://github.com/bos/wreq

https://github.com/boothead/oHm

https://github.com/ocharles/virtual-dom

https://github.com/facebook/Haxl


## Backend libraries

https://github.com/ndmitchell/shake

https://github.com/ndmitchell/bake

https://github.com/MichaelXavier/Angel

https://github.com/snoyberg/conduit

https://github.com/Gabriel439/Haskell-Pipes-Library

https://github.com/bos/criterion

https://github.com/ndmitchell/hlint

https://github.com/bitemyapp/bloodhound

https://github.com/bos/attoparsec

https://github.com/bos/statistics

https://github.com/feuerbach/tasty

https://github.com/haskell/network

https://github.com/Twinside/Juicy.Pixels

https://github.com/ekmett/trifecta

https://github.com/bos/text

https://github.com/haskell/HTTP

https://github.com/alanz/HaRe

https://github.com/djv/VisualProf

https://github.com/tfausak/haskeleton

https://github.com/tibbe/cassava

https://github.com/msgpack/msgpack-haskell

https://github.com/haskell/containers

https://github.com/nick8325/quickspec

https://github.com/wellposed/numerical

https://github.com/lambdabot/lambdabot

https://github.com/bos/pool

https://github.com/ekmett/linear

https://github.com/DDCSF/repa

https://github.com/luqui/data-memocombinators

https://github.com/gazay/faker

http://hackage.haskell.org/package/parallel-3.2.0.4

https://github.com/haskell/ThreadScope

https://github.com/notogawa/graceful

https://github.com/def-/ghc-vis

https://github.com/well-typed/ghc-events-analyze

https://github.com/albertoruiz/hmatrix

https://github.com/sebastiaanvisser/fclabels

https://github.com/haskell-distributed/distributed-process

https://github.com/ndmitchell/hoogle

http://hackage.haskell.org/package/ghc-gc-tune

http://hackage.haskell.org/package/ghc-datasize

https://github.com/GaloisInc/HaLVM


## Beginner code examples

http://hackage.haskell.org/package/base-4.7.0.2/docs/src/Data-List.html

http://hackage.haskell.org/package/base-4.7.0.2/docs/src/Data-Maybe.html

http://hackage.haskell.org/package/containers-0.5.6.3/docs/src/Data-Graph.html

http://hackage.haskell.org/package/base-4.7.0.2/docs/src/Control-Monad.html

https://github.com/isomorphism/these

https://github.com/ekmett/tables

https://github.com/nikita-volkov/graph-db

https://hackage.haskell.org/package/Pugs

https://github.com/bjpop/berp


## Intermediate code examples

https://github.com/PatrickMaier/HdpH

https://github.com/travitch/datalog

https://github.com/molysgaard/Sirkel

https://github.com/HeinrichApfelmus/operational

https://github.com/jcande/secrets

https://github.com/leepike/Copilot

https://github.com/GaloisInc/cryptol

https://github.com/luqui/backward-state

https://github.com/sdiehl/kaleidoscope

https://github.com/evincarofautumn/kitten

https://github.com/kputnam/hee


## Advanced code examples

https://github.com/msaitow/BraHKet

https://github.com/spacekitteh/haskell-clifford

https://github.com/mortberg/AlgTop

https://github.com/felipeZ/Haskell-abinitio

https://github.com/mmirman/regular-manifold-containers

https://github.com/gelisam/circular-sig


## Useful math code

https://github.com/ekmett/algebra

https://github.com/ekmett/ad


## GPGPU

https://github.com/AccelerateHS/accelerate

https://github.com/klarh/hasdy


## Computer security

https://github.com/kmcallister/dewdrop

http://hackage.haskell.org/package/lio

http://hackage.haskell.org/package/seclib


## Pure awesomness, live music coding

https://github.com/tidalcycles/Tidal

## Haskell can do that too! (Just for fun.)

https://github.com/nushio3/dynamic-object

https://github.com/ttuegel/loops


# Check out J

http://www.jsoftware.com/jwiki/NuVoc

It's another language I've worked with and have been slowly working into my workflow more and more. It's the direct descendant of Ken Iverson's APL. https://en.wikipedia.org/wiki/APL_%28programming_language%29

Highly recommended, if you are looking for another "10x" language like Haskell, J is definitely worth a look. I do not personally use it as a general purpose language like I do Haskell, but when I have a problem that fits right into rectangular arrays, I reach for J.

It sits in the same space as hmatrix, repa, and accelerate, but unlike all of them; it implements nested arrays, has been around for longer than Haskell has been around, is a completely different language(!!!), and is dynamically typed. The payoff is the language itself, check out some examples of it on rosettacode.

https://en.wikipedia.org/wiki/J_%28programming_language%29


# As well as APL's other descendants!

A direct descendatnt of APL, if you are the type of person that wishes J looked more like APL, dyalog would be a good bet.

http://dyalog.com/

If you aboslutely need the ability to make operations like rolling avg over billions+ rows (on standard hardware), check out KDB+. Be prepared to pay lots if you plan on having heaps over 4GB, but the free version is just as powerful: The only change is that it is a 32-bit binary.

http://kx.com/
