{-# LANGUAGE CPP #-}
#if __GLASGOW_HASKELL__ <= 708
{-# LANGUAGE OverlappingInstances #-}
#endif
{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns #-}

-- | Pretty-printer for PrintCpp.
--   Generated by the BNF converter.

module PrintCpp where

import qualified AbsCpp
import Data.Char

-- | The top-level printing method.

printTree :: Print a => a -> String
printTree = render . prt 0

type Doc = [ShowS] -> [ShowS]

doc :: ShowS -> Doc
doc = (:)

render :: Doc -> String
render d = rend 0 (map ($ "") $ d []) "" where
  rend i ss = case ss of
    "["      :ts -> showChar '[' . rend i ts
    "("      :ts -> showChar '(' . rend i ts
    "{"      :ts -> showChar '{' . new (i+1) . rend (i+1) ts
    "}" : ";":ts -> new (i-1) . space "}" . showChar ';' . new (i-1) . rend (i-1) ts
    "}"      :ts -> new (i-1) . showChar '}' . new (i-1) . rend (i-1) ts
    ";"      :ts -> showChar ';' . new i . rend i ts
    t  : ts@(p:_) | closingOrPunctuation p -> showString t . rend i ts
    t        :ts -> space t . rend i ts
    _            -> id
  new i   = showChar '\n' . replicateS (2*i) (showChar ' ') . dropWhile isSpace
  space t = showString t . (\s -> if null s then "" else ' ':s)

  closingOrPunctuation :: String -> Bool
  closingOrPunctuation [c] = c `elem` closerOrPunct
  closingOrPunctuation _   = False

  closerOrPunct :: String
  closerOrPunct = ")],;"

parenth :: Doc -> Doc
parenth ss = doc (showChar '(') . ss . doc (showChar ')')

concatS :: [ShowS] -> ShowS
concatS = foldr (.) id

concatD :: [Doc] -> Doc
concatD = foldr (.) id

replicateS :: Int -> ShowS -> ShowS
replicateS n f = concatS (replicate n f)

-- | The printer class does the job.

class Print a where
  prt :: Int -> a -> Doc
  prtList :: Int -> [a] -> Doc
  prtList i = concatD . map (prt i)

instance {-# OVERLAPPABLE #-} Print a => Print [a] where
  prt = prtList

instance Print Char where
  prt _ s = doc (showChar '\'' . mkEsc '\'' s . showChar '\'')
  prtList _ s = doc (showChar '"' . concatS (map (mkEsc '"') s) . showChar '"')

mkEsc :: Char -> Char -> ShowS
mkEsc q s = case s of
  _ | s == q -> showChar '\\' . showChar s
  '\\'-> showString "\\\\"
  '\n' -> showString "\\n"
  '\t' -> showString "\\t"
  _ -> showChar s

prPrec :: Int -> Int -> Doc -> Doc
prPrec i j = if j < i then parenth else id

instance Print Integer where
  prt _ x = doc (shows x)

instance Print Double where
  prt _ x = doc (shows x)

instance Print AbsCpp.Id where
  prt _ (AbsCpp.Id i) = doc (showString i)
  prtList _ [x] = concatD [prt 0 x]
  prtList _ (x:xs) = concatD [prt 0 x, doc (showString ","), prt 0 xs]

instance Print AbsCpp.Program where
  prt i e = case e of
    AbsCpp.PDefs defs -> prPrec i 0 (concatD [prt 0 defs])

instance Print AbsCpp.Def where
  prt i e = case e of
    AbsCpp.DFun type_ id args stms -> prPrec i 0 (concatD [prt 0 type_, prt 0 id, doc (showString "("), prt 0 args, doc (showString ")"), doc (showString "{"), prt 0 stms, doc (showString "}")])
    AbsCpp.DFunc type_ id args -> prPrec i 0 (concatD [prt 0 type_, prt 0 id, doc (showString "("), prt 0 args, doc (showString ")"), doc (showString ";")])
    AbsCpp.DUsing qconst -> prPrec i 0 (concatD [doc (showString "using"), prt 0 qconst, doc (showString ";")])
    AbsCpp.DTypDef type_ id -> prPrec i 0 (concatD [doc (showString "typedef"), prt 0 type_, prt 0 id, doc (showString ";")])
    AbsCpp.DTypDefVect type_ types id -> prPrec i 0 (concatD [doc (showString "typedef"), prt 0 type_, doc (showString "<"), prt 0 types, doc (showString ">"), prt 0 id])
    AbsCpp.DDeclVar type_ ids -> prPrec i 0 (concatD [prt 0 type_, prt 0 ids, doc (showString ";")])
  prtList _ [] = concatD []
  prtList _ (x:xs) = concatD [prt 0 x, prt 0 xs]

instance Print [AbsCpp.Def] where
  prt = prtList

instance Print AbsCpp.Arg where
  prt i e = case e of
    AbsCpp.ADecl type_ id -> prPrec i 0 (concatD [prt 0 type_, prt 0 id])
    AbsCpp.AType type_ -> prPrec i 0 (concatD [prt 0 type_])
    AbsCpp.AConst type_ id -> prPrec i 0 (concatD [doc (showString "const"), prt 0 type_, prt 0 id])
    AbsCpp.AConstType type_ -> prPrec i 0 (concatD [doc (showString "const"), prt 0 type_])
  prtList _ [] = concatD []
  prtList _ [x] = concatD [prt 0 x]
  prtList _ (x:xs) = concatD [prt 0 x, doc (showString ","), prt 0 xs]

instance Print [AbsCpp.Arg] where
  prt = prtList

instance Print AbsCpp.Stm where
  prt i e = case e of
    AbsCpp.SExp exp -> prPrec i 0 (concatD [prt 0 exp, doc (showString ";")])
    AbsCpp.SDecls declaration -> prPrec i 0 (concatD [prt 0 declaration, doc (showString ";")])
    AbsCpp.SInit declaration exp -> prPrec i 0 (concatD [prt 0 declaration, doc (showString "="), prt 0 exp, doc (showString ";")])
    AbsCpp.SReturn exp -> prPrec i 0 (concatD [doc (showString "return"), prt 0 exp, doc (showString ";")])
    AbsCpp.SReturnVoid -> prPrec i 0 (concatD [doc (showString "return"), doc (showString ";")])
    AbsCpp.SWhile exp stm -> prPrec i 0 (concatD [doc (showString "while"), doc (showString "("), prt 0 exp, doc (showString ")"), prt 0 stm])
    AbsCpp.SBlock stms -> prPrec i 0 (concatD [doc (showString "{"), prt 0 stms, doc (showString "}")])
    AbsCpp.SIfElse exp stm contd -> prPrec i 0 (concatD [doc (showString "if"), doc (showString "("), prt 0 exp, doc (showString ")"), prt 0 stm, prt 0 contd])
    AbsCpp.SDoWhi stm exp -> prPrec i 0 (concatD [doc (showString "do"), prt 0 stm, doc (showString "while"), doc (showString "("), prt 0 exp, doc (showString ")"), doc (showString ";")])
    AbsCpp.SFor stm1 exp1 exp2 stm2 -> prPrec i 0 (concatD [doc (showString "for"), doc (showString "("), prt 0 stm1, prt 0 exp1, doc (showString ";"), prt 0 exp2, doc (showString ")"), prt 0 stm2])
    AbsCpp.STypDef type_ id -> prPrec i 0 (concatD [doc (showString "typedef"), prt 0 type_, prt 0 id, doc (showString ";")])
  prtList _ [] = concatD []
  prtList _ (x:xs) = concatD [prt 0 x, prt 0 xs]

instance Print [AbsCpp.Stm] where
  prt = prtList

instance Print AbsCpp.Declaration where
  prt i e = case e of
    AbsCpp.DeclaSim type_ ids -> prPrec i 0 (concatD [prt 0 type_, prt 0 ids])
    AbsCpp.DeclaConst type_ id -> prPrec i 0 (concatD [doc (showString "const"), prt 0 type_, prt 0 id])

instance Print AbsCpp.Contd where
  prt i e = case e of
    AbsCpp.YesContd stm -> prPrec i 0 (concatD [doc (showString "else"), prt 0 stm])
    AbsCpp.NoContd -> prPrec i 0 (concatD [])

instance Print AbsCpp.Exp where
  prt i e = case e of
    AbsCpp.ECondit exp1 exp2 exp3 -> prPrec i 1 (concatD [prt 0 exp1, doc (showString "?"), prt 2 exp2, doc (showString ":"), prt 2 exp3])
    AbsCpp.EExcept exp -> prPrec i 2 (concatD [doc (showString "throw"), prt 0 exp])
    AbsCpp.EPlusEq exp1 exp2 -> prPrec i 2 (concatD [prt 3 exp1, doc (showString "+="), prt 2 exp2])
    AbsCpp.EMinEq exp1 exp2 -> prPrec i 2 (concatD [prt 3 exp1, doc (showString "-="), prt 2 exp2])
    AbsCpp.EAss exp1 exp2 -> prPrec i 2 (concatD [prt 3 exp1, doc (showString "="), prt 2 exp2])
    AbsCpp.EOr exp1 exp2 -> prPrec i 3 (concatD [prt 3 exp1, doc (showString "||"), prt 4 exp2])
    AbsCpp.EAnd exp1 exp2 -> prPrec i 4 (concatD [prt 4 exp1, doc (showString "&&"), prt 5 exp2])
    AbsCpp.ENEq exp1 exp2 -> prPrec i 8 (concatD [prt 8 exp1, doc (showString "!="), prt 9 exp2])
    AbsCpp.EEq exp1 exp2 -> prPrec i 8 (concatD [prt 8 exp1, doc (showString "=="), prt 9 exp2])
    AbsCpp.EGEq exp1 exp2 -> prPrec i 9 (concatD [prt 9 exp1, doc (showString ">="), prt 10 exp2])
    AbsCpp.ELEq exp1 exp2 -> prPrec i 9 (concatD [prt 9 exp1, doc (showString "<="), prt 10 exp2])
    AbsCpp.EGt exp1 exp2 -> prPrec i 9 (concatD [prt 9 exp1, doc (showString ">"), prt 10 exp2])
    AbsCpp.ELt exp1 exp2 -> prPrec i 9 (concatD [prt 9 exp1, doc (showString "<"), prt 10 exp2])
    AbsCpp.ERShift exp1 exp2 -> prPrec i 10 (concatD [prt 10 exp1, doc (showString ">>"), prt 11 exp2])
    AbsCpp.ELShift exp1 exp2 -> prPrec i 10 (concatD [prt 10 exp1, doc (showString "<<"), prt 11 exp2])
    AbsCpp.EMinus exp1 exp2 -> prPrec i 11 (concatD [prt 11 exp1, doc (showString "-"), prt 12 exp2])
    AbsCpp.EPlus exp1 exp2 -> prPrec i 11 (concatD [prt 11 exp1, doc (showString "+"), prt 12 exp2])
    AbsCpp.EMod exp1 exp2 -> prPrec i 12 (concatD [prt 13 exp1, doc (showString "%"), prt 12 exp2])
    AbsCpp.EDiv exp1 exp2 -> prPrec i 12 (concatD [prt 12 exp1, doc (showString "/"), prt 13 exp2])
    AbsCpp.ETimes exp1 exp2 -> prPrec i 12 (concatD [prt 12 exp1, doc (showString "*"), prt 13 exp2])
    AbsCpp.EPointer exp -> prPrec i 13 (concatD [doc (showString "*"), prt 13 exp])
    AbsCpp.ENegBool exp -> prPrec i 13 (concatD [doc (showString "!"), prt 13 exp])
    AbsCpp.ENegInt exp -> prPrec i 13 (concatD [doc (showString "-"), prt 13 exp])
    AbsCpp.EDecr exp -> prPrec i 13 (concatD [doc (showString "--"), prt 13 exp])
    AbsCpp.EIncr exp -> prPrec i 13 (concatD [doc (showString "++"), prt 13 exp])
    AbsCpp.EAssPointer exp1 exp2 -> prPrec i 14 (concatD [prt 14 exp1, doc (showString "->"), prt 15 exp2])
    AbsCpp.ERefCall exp1 exp2 -> prPrec i 14 (concatD [prt 14 exp1, doc (showString "."), prt 15 exp2])
    AbsCpp.EArray exp1 exp2 -> prPrec i 14 (concatD [prt 14 exp1, doc (showString "["), prt 0 exp2, doc (showString "]")])
    AbsCpp.ECall exp exps -> prPrec i 14 (concatD [prt 14 exp, doc (showString "("), prt 0 exps, doc (showString ")")])
    AbsCpp.EPostDecr exp -> prPrec i 14 (concatD [prt 14 exp, doc (showString "--")])
    AbsCpp.EPostIncr exp -> prPrec i 14 (concatD [prt 14 exp, doc (showString "++")])
    AbsCpp.EQConst qconst -> prPrec i 15 (concatD [prt 0 qconst])
    AbsCpp.ETrue -> prPrec i 15 (concatD [doc (showString "true")])
    AbsCpp.EFalse -> prPrec i 15 (concatD [doc (showString "false")])
    AbsCpp.EString strs -> prPrec i 15 (concatD [prt 0 strs])
    AbsCpp.EChar c -> prPrec i 15 (concatD [prt 0 c])
    AbsCpp.EInt n -> prPrec i 15 (concatD [prt 0 n])
    AbsCpp.EDouble d -> prPrec i 15 (concatD [prt 0 d])
    AbsCpp.EPred type_1 type_2 -> prPrec i 15 (concatD [prt 0 type_1, prt 0 type_2])
    AbsCpp.ETyped exp type_ -> prPrec i 15 (concatD [doc (showString "("), prt 0 exp, doc (showString ":"), prt 0 type_, doc (showString ")")])
  prtList _ [] = concatD []
  prtList _ [x] = concatD [prt 0 x]
  prtList _ (x:xs) = concatD [prt 0 x, doc (showString ","), prt 0 xs]

instance Print [AbsCpp.Exp] where
  prt = prtList

instance Print AbsCpp.QConst where
  prt i e = case e of
    AbsCpp.QuConst elmts -> prPrec i 0 (concatD [prt 0 elmts])

instance Print AbsCpp.Elmt where
  prt i e = case e of
    AbsCpp.QCElmt id -> prPrec i 0 (concatD [prt 0 id])
    AbsCpp.QCElntt id types -> prPrec i 0 (concatD [prt 0 id, doc (showString "<"), prt 0 types, doc (showString ">")])
  prtList _ [x] = concatD [prt 0 x]
  prtList _ (x:xs) = concatD [prt 0 x, doc (showString "::"), prt 0 xs]

instance Print AbsCpp.Type where
  prt i e = case e of
    AbsCpp.TypInt -> prPrec i 0 (concatD [doc (showString "int")])
    AbsCpp.TypChar -> prPrec i 0 (concatD [doc (showString "char")])
    AbsCpp.TypBool -> prPrec i 0 (concatD [doc (showString "bool")])
    AbsCpp.TypVoid -> prPrec i 0 (concatD [doc (showString "void")])
    AbsCpp.TypDoub -> prPrec i 0 (concatD [doc (showString "double")])
    AbsCpp.TypQC qconst -> prPrec i 0 (concatD [prt 0 qconst])
    AbsCpp.TypRef type_ -> prPrec i 0 (concatD [prt 0 type_, doc (showString "&")])
  prtList _ [x] = concatD [prt 0 x]
  prtList _ (x:xs) = concatD [prt 0 x, doc (showString ","), prt 0 xs]

instance Print [AbsCpp.Id] where
  prt = prtList

instance Print [AbsCpp.Type] where
  prt = prtList

instance Print [String] where
  prt = prtList

instance Print [AbsCpp.Elmt] where
  prt = prtList

