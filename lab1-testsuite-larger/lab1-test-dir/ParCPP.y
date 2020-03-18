-- This Happy file was machine-generated by the BNF converter
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParCPP where
import AbsCPP
import LexCPP
import ErrM

}

%name pProgram Program
%name pDef Def
%name pListDef ListDef
%name pArg Arg
%name pListArg ListArg
%name pStm Stm
%name pListStm ListStm
%name pDeclaration Declaration
%name pContd Contd
%name pExp1 Exp1
%name pExp2 Exp2
%name pExp3 Exp3
%name pExp4 Exp4
%name pExp8 Exp8
%name pExp9 Exp9
%name pExp10 Exp10
%name pExp11 Exp11
%name pExp12 Exp12
%name pExp13 Exp13
%name pExp14 Exp14
%name pExp15 Exp15
%name pExp Exp
%name pExp5 Exp5
%name pExp6 Exp6
%name pExp7 Exp7
%name pListExp ListExp
%name pQConst QConst
%name pElmt Elmt
%name pType Type
%name pListId ListId
%name pListType ListType
%name pListString ListString
%name pListElmt ListElmt
-- no lexer declaration
%monad { Err } { thenM } { returnM }
%tokentype {Token}
%token
  '!' { PT _ (TS _ 1) }
  '!=' { PT _ (TS _ 2) }
  '%' { PT _ (TS _ 3) }
  '&' { PT _ (TS _ 4) }
  '&&' { PT _ (TS _ 5) }
  '(' { PT _ (TS _ 6) }
  ')' { PT _ (TS _ 7) }
  '*' { PT _ (TS _ 8) }
  '+' { PT _ (TS _ 9) }
  '++' { PT _ (TS _ 10) }
  '+=' { PT _ (TS _ 11) }
  ',' { PT _ (TS _ 12) }
  '-' { PT _ (TS _ 13) }
  '--' { PT _ (TS _ 14) }
  '-=' { PT _ (TS _ 15) }
  '->' { PT _ (TS _ 16) }
  '.' { PT _ (TS _ 17) }
  '/' { PT _ (TS _ 18) }
  ':' { PT _ (TS _ 19) }
  '::' { PT _ (TS _ 20) }
  ';' { PT _ (TS _ 21) }
  '<' { PT _ (TS _ 22) }
  '<<' { PT _ (TS _ 23) }
  '<=' { PT _ (TS _ 24) }
  '=' { PT _ (TS _ 25) }
  '==' { PT _ (TS _ 26) }
  '>' { PT _ (TS _ 27) }
  '>=' { PT _ (TS _ 28) }
  '>>' { PT _ (TS _ 29) }
  '?' { PT _ (TS _ 30) }
  '[' { PT _ (TS _ 31) }
  ']' { PT _ (TS _ 32) }
  'bool' { PT _ (TS _ 33) }
  'char' { PT _ (TS _ 34) }
  'const' { PT _ (TS _ 35) }
  'do' { PT _ (TS _ 36) }
  'double' { PT _ (TS _ 37) }
  'else' { PT _ (TS _ 38) }
  'false' { PT _ (TS _ 39) }
  'for' { PT _ (TS _ 40) }
  'if' { PT _ (TS _ 41) }
  'int' { PT _ (TS _ 42) }
  'return' { PT _ (TS _ 43) }
  'throw' { PT _ (TS _ 44) }
  'true' { PT _ (TS _ 45) }
  'typedef' { PT _ (TS _ 46) }
  'using' { PT _ (TS _ 47) }
  'void' { PT _ (TS _ 48) }
  'while' { PT _ (TS _ 49) }
  '{' { PT _ (TS _ 50) }
  '||' { PT _ (TS _ 51) }
  '}' { PT _ (TS _ 52) }
  L_charac { PT _ (TC $$) }
  L_integ  { PT _ (TI $$) }
  L_doubl  { PT _ (TD $$) }
  L_quoted { PT _ (TL $$) }
  L_Id { PT _ (T_Id $$) }

%%

Char    :: { Char }
Char     : L_charac { (read ( $1)) :: Char }

Integer :: { Integer }
Integer  : L_integ  { (read ( $1)) :: Integer }

Double  :: { Double }
Double   : L_doubl  { (read ( $1)) :: Double }

String  :: { String }
String   : L_quoted {  $1 }

Id :: { Id}
Id  : L_Id { Id ($1)}

Program :: { Program }
Program : ListDef { AbsCPP.PDefs (reverse $1) }
Def :: { Def }
Def : Type Id '(' ListArg ')' '{' ListStm '}' { AbsCPP.DFun $1 $2 $4 (reverse $7) }
    | Type Id '(' ListArg ')' ';' { AbsCPP.DFunc $1 $2 $4 }
    | 'using' QConst ';' { AbsCPP.DUsing $2 }
    | 'typedef' Type Id ';' { AbsCPP.DTypDef $2 $3 }
    | 'typedef' Type '<' ListType '>' Id { AbsCPP.DTypDefVect $2 $4 $6 }
    | Type ListId ';' { AbsCPP.DDeclVar $1 $2 }
ListDef :: { [Def] }
ListDef : {- empty -} { [] } | ListDef Def { flip (:) $1 $2 }
Arg :: { Arg }
Arg : Type Id { AbsCPP.ADecl $1 $2 }
    | Type { AbsCPP.AType $1 }
    | 'const' Type Id { AbsCPP.AConst $2 $3 }
    | 'const' Type { AbsCPP.AConstType $2 }
ListArg :: { [Arg] }
ListArg : {- empty -} { [] }
        | Arg { (:[]) $1 }
        | Arg ',' ListArg { (:) $1 $3 }
Stm :: { Stm }
Stm : Exp ';' { AbsCPP.SExp $1 }
    | Declaration ';' { AbsCPP.SDecls $1 }
    | Declaration '=' Exp ';' { AbsCPP.SInit $1 $3 }
    | 'return' Exp ';' { AbsCPP.SReturn $2 }
    | 'return' ';' { AbsCPP.SReturnVoid }
    | 'while' '(' Exp ')' Stm { AbsCPP.SWhile $3 $5 }
    | '{' ListStm '}' { AbsCPP.SBlock (reverse $2) }
    | 'if' '(' Exp ')' Stm Contd { AbsCPP.SIfElse $3 $5 $6 }
    | 'do' Stm 'while' '(' Exp ')' ';' { AbsCPP.SDoWhi $2 $5 }
    | 'for' '(' Stm Exp ';' Exp ')' Stm { AbsCPP.SFor $3 $4 $6 $8 }
    | 'typedef' Type Id ';' { AbsCPP.STypDef $2 $3 }
ListStm :: { [Stm] }
ListStm : {- empty -} { [] } | ListStm Stm { flip (:) $1 $2 }
Declaration :: { Declaration }
Declaration : Type ListId { AbsCPP.DeclaSim $1 $2 }
            | 'const' Type Id { AbsCPP.DeclaConst $2 $3 }
Contd :: { Contd }
Contd : 'else' Stm { AbsCPP.YesContd $2 }
      | {- empty -} { AbsCPP.NoContd }
Exp1 :: { Exp }
Exp1 : Exp '?' Exp2 ':' Exp2 { AbsCPP.ECondit $1 $3 $5 }
     | Exp2 { $1 }
Exp2 :: { Exp }
Exp2 : 'throw' Exp { AbsCPP.EExcept $2 }
     | Exp3 '+=' Exp2 { AbsCPP.EPlusEq $1 $3 }
     | Exp3 '-=' Exp2 { AbsCPP.EMinEq $1 $3 }
     | Exp3 '=' Exp2 { AbsCPP.EAss $1 $3 }
     | Exp3 { $1 }
Exp3 :: { Exp }
Exp3 : Exp3 '||' Exp4 { AbsCPP.EOr $1 $3 } | Exp4 { $1 }
Exp4 :: { Exp }
Exp4 : Exp4 '&&' Exp5 { AbsCPP.EAnd $1 $3 } | Exp5 { $1 }
Exp8 :: { Exp }
Exp8 : Exp8 '!=' Exp9 { AbsCPP.ENEq $1 $3 }
     | Exp8 '==' Exp9 { AbsCPP.EEq $1 $3 }
     | Exp9 { $1 }
Exp9 :: { Exp }
Exp9 : Exp9 '>=' Exp10 { AbsCPP.EGEq $1 $3 }
     | Exp9 '<=' Exp10 { AbsCPP.ELEq $1 $3 }
     | Exp9 '>' Exp10 { AbsCPP.EGt $1 $3 }
     | Exp9 '<' Exp10 { AbsCPP.ELt $1 $3 }
     | Exp10 { $1 }
Exp10 :: { Exp }
Exp10 : Exp10 '>>' Exp11 { AbsCPP.ERShift $1 $3 }
      | Exp10 '<<' Exp11 { AbsCPP.ELShift $1 $3 }
      | Exp11 { $1 }
Exp11 :: { Exp }
Exp11 : Exp11 '-' Exp12 { AbsCPP.EMinus $1 $3 }
      | Exp11 '+' Exp12 { AbsCPP.EPlus $1 $3 }
      | Exp12 { $1 }
Exp12 :: { Exp }
Exp12 : Exp13 '%' Exp12 { AbsCPP.EMod $1 $3 }
      | Exp12 '/' Exp13 { AbsCPP.EDiv $1 $3 }
      | Exp12 '*' Exp13 { AbsCPP.ETimes $1 $3 }
      | Exp13 { $1 }
Exp13 :: { Exp }
Exp13 : '*' Exp13 { AbsCPP.EPointer $2 }
      | '!' Exp13 { AbsCPP.ENegBool $2 }
      | '-' Exp13 { AbsCPP.ENegInt $2 }
      | '--' Exp13 { AbsCPP.EDecr $2 }
      | '++' Exp13 { AbsCPP.EIncr $2 }
      | Exp14 { $1 }
Exp14 :: { Exp }
Exp14 : Exp14 '->' Exp15 { AbsCPP.EAssPointer $1 $3 }
      | Exp14 '.' Exp15 { AbsCPP.ERefCall $1 $3 }
      | Exp14 '[' Exp ']' { AbsCPP.EArray $1 $3 }
      | Exp14 '(' ListExp ')' { AbsCPP.ECall $1 $3 }
      | Exp14 '--' { AbsCPP.EPostDecr $1 }
      | Exp14 '++' { AbsCPP.EPostIncr $1 }
      | Exp15 { $1 }
Exp15 :: { Exp }
Exp15 : QConst { AbsCPP.EQConst $1 }
      | 'true' { AbsCPP.ETrue }
      | 'false' { AbsCPP.EFalse }
      | ListString { AbsCPP.EString $1 }
      | Char { AbsCPP.EChar $1 }
      | Integer { AbsCPP.EInt $1 }
      | Double { AbsCPP.EDouble $1 }
      | Type Type { AbsCPP.EPred $1 $2 }
      | '(' Exp ')' { $2 }
Exp :: { Exp }
Exp : Exp1 { $1 }
Exp5 :: { Exp }
Exp5 : Exp6 { $1 }
Exp6 :: { Exp }
Exp6 : Exp7 { $1 }
Exp7 :: { Exp }
Exp7 : Exp8 { $1 }
ListExp :: { [Exp] }
ListExp : {- empty -} { [] }
        | Exp { (:[]) $1 }
        | Exp ',' ListExp { (:) $1 $3 }
QConst :: { QConst }
QConst : ListElmt { AbsCPP.QuConst $1 }
Elmt :: { Elmt }
Elmt : Id { AbsCPP.QCElmt $1 }
     | Id '<' ListType '>' { AbsCPP.QCElntt $1 $3 }
Type :: { Type }
Type : 'int' { AbsCPP.TypInt }
     | 'char' { AbsCPP.TypChar }
     | 'bool' { AbsCPP.TypBool }
     | 'void' { AbsCPP.TypVoid }
     | 'double' { AbsCPP.TypDoub }
     | QConst { AbsCPP.TypQC $1 }
     | Type '&' { AbsCPP.TypRef $1 }
ListId :: { [Id] }
ListId : Id { (:[]) $1 } | Id ',' ListId { (:) $1 $3 }
ListType :: { [Type] }
ListType : Type { (:[]) $1 } | Type ',' ListType { (:) $1 $3 }
ListString :: { [String] }
ListString : String { (:[]) $1 } | String ListString { (:) $1 $2 }
ListElmt :: { [Elmt] }
ListElmt : Elmt { (:[]) $1 } | Elmt '::' ListElmt { (:) $1 $3 }
{

returnM :: a -> Err a
returnM = return

thenM :: Err a -> (a -> Err b) -> Err b
thenM = (>>=)

happyError :: [Token] -> Err a
happyError ts =
  Bad $ "syntax error at " ++ tokenPos ts ++
  case ts of
    []      -> []
    [Err _] -> " due to lexer error"
    t:_     -> " before `" ++ id(prToken t) ++ "'"

myLexer = tokens
}
