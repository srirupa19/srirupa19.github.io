---
layout: post
title: "Writing a Monadic Interpreter in Haskell"
date:   2025-06-18 00:03:36 +0530

---
<p align="center">
  <img src="/assets/haskell.png" alt="Car Game" width="100%" />
</p>


Back in my second year of college, I had just started exploring functional programming. I was picking up Haskell out of curiosity - it felt different, abstract, and honestly a bit intimidating at first. Around the same time, I was also diving into topics like context-free grammars, automata theory, parse trees, and the Chomsky hierarchy - all the foundational concepts that explain how programming languages are parsed, interpreted, and understood by machines.

Somewhere along the way, it hit me: what if I could build something with both? What could be more fun than writing an interpreter for an imperative programming language using a functional one? That idea stuck - and over the next few weeks, I set out to build a purely functional monadic interpreter in Haskell.

I designed the grammar for the language myself, mostly inspired by Python. I wanted it to support loops, conditionals, variable assignments, print statements, and basic arithmetic, boolean, and string operations. It even has a “++” operator for string concatenation. Writing the grammar rules involved figuring out how to model nested blocks, expressions with precedence, and side-effect-free evaluation. I built the entire thing using monadic parser combinators—no parser generators or external libraries, just Haskell’s type system and some stubbornness.

Here’s a rough look at the grammar that powers the interpreter:

    Block 
        : { Part }

    Part 
        : Statement Part
        | IfStatement Part
        | WhileLoop Part
        | Comment String Part
        | epsilon

    Statement 
        : var = AllExpr;
        | print( AllExpr );

    AllExpr 
        : Sentences ++ AllExpr
        | Sentences

    Sentences
        : string
        | LogicExpr

    IfStatement
        : if ( LogicExpr ) Block else Block

    WhileLoop
        : while ( LogicExpr ) Block 

    LogicExpr
        : BoolExpr && LogicExpr
        | BoolExpr || LogicExpr
        | BoolExpr

    BoolExpr 
        : True
        | False
        | ArithBoolExpr

    ArithBoolExpr
        : Expr > Expr
        | Expr < Expr
        | Expr == Expr
        | Expr != Expr
        | Expr

    Expr 
        : HiExpr + Expr
        | HiExpr - Expr
        | HiExpr

    HiExpr 
        : SignExpr * HiExpr
        | SignExpr / HiExpr
        | SignExpr % HiExpr
        | SignExpr 

    SignExpr
        : int
        | ( AllExpr )
        | var


The interpreter parses the source code using this grammar, builds an abstract syntax tree, and evaluates it by simulating an environment. There’s no mutation—it just returns a new environment every time a variable is assigned or a block is executed.

Running it is simple enough. After compiling with GHC, it reads the program from stdin and prints the resulting variable bindings and any output generated by `print()` statements.

```bash
ghc -o interpreter interpreter.hs
./interpreter
```

Here’s a sample program to show how it works:

``` 
  
    { 
        i = 5;
        a = (4 < 3) || 6 != 7;
        print(a);

        # First While! #
        while(i != 0 && a) 
        { 
            print(i); 
            i = i - 1; 
        }

    }

    Output : a True
             i 0
             print True 5 4 3 2 1 
```

Once I had the interpreter working, I wanted to make it a bit more fun to interact with. So I built a small GUI in Python using tkinter. It’s nothing fancy—just a textbox to enter code, a button to run it, and an output area to display the result. When you click “Run,” the Python script sends the code to the Haskell interpreter and prints whatever comes back. 

The entire thing—from parsing to evaluation—is written in a purely functional style. No mutable state, no IO hacks, no shortcuts. Just expressions flowing through types and functions. It’s probably not the fastest interpreter out there, but writing it did teach me a lot about how languages work under the hood.

