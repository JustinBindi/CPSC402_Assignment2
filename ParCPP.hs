{-# OPTIONS_GHC -w #-}
{-# OPTIONS -cpp #-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParCpp where
import AbsCpp
import LexCpp
import ErrM
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified System.IO as Happy_System_IO
import qualified System.IO.Unsafe as Happy_System_IO_Unsafe
import qualified Debug.Trace as Happy_Debug_Trace
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.11

data HappyAbsSyn 
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn29 (Integer)
	| HappyAbsSyn30 (Double)
	| HappyAbsSyn31 (String)
	| HappyAbsSyn32 (Id)
	| HappyAbsSyn33 (Program)
	| HappyAbsSyn34 (Def)
	| HappyAbsSyn35 ([Def])
	| HappyAbsSyn36 (Arg)
	| HappyAbsSyn37 ([Arg])
	| HappyAbsSyn38 (Stm)
	| HappyAbsSyn39 ([Stm])
	| HappyAbsSyn40 (Exp)
	| HappyAbsSyn56 ([Exp])
	| HappyAbsSyn57 (Type)
	| HappyAbsSyn58 ([Id])

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,1104) ([0,0,0,0,0,0,0,0,0,0,6144,21,0,0,0,0,0,0,0,0,0,0,17920,5,0,0,0,0,41728,2,0,0,0,18560,64896,487,0,0,0,0,0,0,0,0,0,32,8448,120,0,0,0,16,4224,60,0,0,0,1160,2112,30,0,0,0,580,1056,15,0,0,0,290,33296,7,0,0,0,145,49416,3,0,0,32768,72,57476,1,0,0,16384,36,61506,0,0,0,8192,18,30753,0,0,0,4096,32777,15376,0,0,0,34816,16388,7688,0,0,0,17408,8194,3844,0,0,0,8704,4097,1922,0,0,0,37120,2048,961,0,0,0,18560,33792,480,0,0,0,9280,16896,240,0,0,0,4640,8448,120,0,0,0,0,10800,0,0,0,0,0,0,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,1152,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,260,0,0,0,0,0,36,0,0,0,0,0,13056,0,0,0,0,2048,1024,0,0,0,0,2048,0,0,0,0,0,0,128,128,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,580,1056,15,0,0,0,2,33296,7,0,0,0,1,49416,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,4,0,0,0,0,0,32769,0,0,0,0,0,38912,1,0,0,0,0,72,0,0,0,0,0,130,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,34816,55300,7807,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,512,0,0,0,128,0,0,0,0,0,42048,16896,240,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,32768,337,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,6144,21,0,0,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,20864,1,0,0,0,9280,65216,251,0,0,0,4640,8448,120,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,580,1056,15,0,0,0,8256,0,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,18,30753,0,0,0,4096,32777,15376,0,0,0,34816,16388,7688,0,0,0,17408,8194,3844,0,0,0,8704,4097,1922,0,0,0,37120,2048,961,0,0,0,18560,33792,480,0,0,0,9280,16896,240,0,0,0,4640,8448,120,0,0,0,2320,4224,60,0,0,0,1160,2112,30,0,0,0,580,1056,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,16384,36,61506,0,0,0,8192,18,30753,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,17408,8194,3844,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,38912,1,0,0,0,0,52224,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,8,0,0,0,0,4096,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9280,16896,240,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,675,0,0,0,0,1,0,0,0,0,16384,49188,62462,0,0,0,8192,24594,31231,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,4640,65376,121,0,0,0,0,0,0,0,0,0,1160,32728,31,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pProgram","%start_pDef","%start_pListDef","%start_pArg","%start_pListArg","%start_pStm","%start_pListStm","%start_pExp15","%start_pExp14","%start_pExp13","%start_pExp12","%start_pExp11","%start_pExp9","%start_pExp8","%start_pExp4","%start_pExp3","%start_pExp2","%start_pExp","%start_pExp1","%start_pExp5","%start_pExp6","%start_pExp7","%start_pExp10","%start_pListExp","%start_pType","%start_pListId","Integer","Double","String","Id","Program","Def","ListDef","Arg","ListArg","Stm","ListStm","Exp15","Exp14","Exp13","Exp12","Exp11","Exp9","Exp8","Exp4","Exp3","Exp2","Exp","Exp1","Exp5","Exp6","Exp7","Exp10","ListExp","Type","ListId","'!='","'&&'","'('","')'","'*'","'+'","'++'","','","'-'","'--'","'/'","';'","'<'","'<='","'='","'=='","'>'","'>='","'bool'","'double'","'else'","'false'","'if'","'int'","'return'","'string'","'true'","'void'","'while'","'{'","'||'","'}'","L_integ","L_doubl","L_quoted","L_Id","%eof"]
        bit_start = st * 95
        bit_end = (st + 1) * 95
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..94]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

happyActOffsets :: Happy_Data_Array.Array Int Int
happyActOffsets = Happy_Data_Array.listArray (0,171) ([0,1035,0,1035,1035,123,0,177,177,167,167,167,167,167,167,167,167,167,167,167,167,167,167,167,1035,-12,26,0,25,27,0,27,0,0,0,0,0,0,0,0,60,93,0,0,10,128,84,6,67,37,0,62,0,0,0,0,0,34,167,177,177,0,0,0,0,34,34,34,34,34,34,34,29,-1,1,118,4,-2,34,34,34,20,34,64,50,91,157,92,0,96,68,74,83,-8,83,102,107,1035,0,125,0,1035,55,167,117,0,167,11,127,0,0,167,167,167,167,167,167,167,167,167,167,167,167,0,0,150,167,167,0,0,167,126,0,162,0,0,0,166,0,84,84,0,0,0,0,56,56,0,0,0,167,168,0,169,0,0,1035,171,123,123,164,0,0,160,0,141,0,123,0,89,0,0
	])

happyGotoOffsets :: Happy_Data_Array.Array Int Int
happyGotoOffsets = Happy_Data_Array.listArray (0,171) ([159,9,172,-3,65,205,173,1049,1019,185,976,960,861,843,733,706,652,463,625,771,807,825,912,379,154,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,490,1032,1036,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,234,0,0,3,0,517,0,199,0,0,192,0,23,0,212,0,23,0,0,0,99,234,544,0,0,571,0,0,0,0,1001,1015,982,997,917,933,939,955,878,895,789,752,0,0,0,407,679,0,0,435,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,598,0,0,0,0,0,133,0,263,292,0,0,0,0,0,0,222,321,0,350,0,0
	])

happyAdjustOffset :: Int -> Int
happyAdjustOffset = id

happyDefActions :: Happy_Data_Array.Array Int Int
happyDefActions = Happy_Data_Array.listArray (0,171) ([-33,0,-33,0,-36,0,-47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-89,0,0,0,-27,-97,0,-30,0,-92,-94,-93,-96,-95,-51,-52,-53,-54,-59,-62,-65,-68,-88,-76,-87,-80,-82,-84,-90,-83,-78,-85,-86,-73,0,0,0,0,-50,-49,-28,-29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-47,-37,0,0,0,0,0,0,0,-31,-34,0,-35,-36,0,0,0,-43,0,-97,0,-39,-48,0,0,0,0,0,0,0,0,0,0,0,0,-61,-60,0,-89,0,-57,-58,-89,0,-98,0,-81,-91,-56,-79,-77,-74,-75,-72,-70,-71,-69,-67,-66,-64,-63,-40,0,0,-42,0,-45,-38,-36,0,0,0,0,-55,-41,0,-44,0,-47,0,-46,0,-32
	])

happyCheck :: Happy_Data_Array.Array Int Int
happyCheck = Happy_Data_Array.listArray (0,1104) ([-1,2,1,5,7,3,3,1,3,11,6,19,20,9,5,5,24,16,26,8,28,11,16,3,36,28,15,7,5,37,10,29,29,8,29,37,37,28,37,19,20,37,22,23,24,25,26,27,28,29,30,28,15,33,34,35,36,37,3,33,31,5,7,3,37,10,37,11,31,2,8,37,7,8,19,20,12,22,23,24,25,26,27,28,29,30,36,32,33,34,35,36,3,28,3,3,7,13,14,10,7,17,18,10,8,37,7,8,19,20,36,22,23,24,25,26,27,28,29,30,37,32,33,34,35,36,3,28,3,12,7,13,14,10,6,17,18,9,36,12,7,8,19,20,37,22,23,24,25,26,27,28,29,30,4,37,33,34,35,36,3,28,36,4,7,6,4,10,2,12,3,30,4,4,7,4,12,10,6,22,3,21,28,10,27,0,1,2,3,22,33,34,35,36,27,3,11,12,13,22,33,34,35,36,27,0,1,2,3,10,33,34,35,36,9,3,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,10,28,0,1,2,3,-1,-1,-1,-1,-1,9,-1,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,-1,28,0,1,2,3,-1,-1,-1,-1,-1,9,-1,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,-1,28,0,1,2,3,-1,-1,-1,-1,-1,9,-1,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,-1,28,0,1,2,3,-1,-1,-1,-1,-1,9,-1,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,-1,28,0,1,2,3,-1,-1,-1,-1,-1,9,-1,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,-1,28,0,1,2,3,-1,-1,-1,-1,-1,-1,-1,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,0,1,2,3,-1,-1,-1,-1,-1,-1,-1,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,0,1,2,3,-1,-1,-1,-1,-1,-1,-1,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,0,1,2,3,-1,-1,-1,-1,-1,-1,-1,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,0,1,2,3,-1,-1,-1,-1,-1,-1,-1,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,0,1,2,3,-1,-1,-1,-1,-1,-1,-1,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,0,1,2,3,-1,-1,-1,-1,-1,-1,-1,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,0,1,2,3,-1,-1,-1,-1,-1,-1,-1,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,0,1,2,3,-1,-1,-1,-1,-1,-1,-1,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,0,1,2,3,-1,-1,-1,-1,-1,-1,-1,11,12,13,14,15,16,17,18,19,20,-1,22,23,24,25,26,0,1,2,3,-1,-1,-1,-1,-1,-1,-1,11,12,13,14,15,16,17,18,19,20,-1,-1,23,24,25,26,0,1,2,3,-1,-1,-1,-1,-1,-1,-1,11,12,13,14,15,16,17,18,19,20,-1,-1,23,24,25,26,0,1,2,3,-1,-1,-1,-1,-1,-1,-1,11,12,13,14,15,16,17,18,19,-1,-1,-1,23,24,25,26,0,1,2,3,-1,-1,-1,-1,-1,-1,-1,11,12,13,14,15,16,17,18,0,1,2,3,23,24,25,26,-1,-1,-1,11,12,13,14,15,16,17,18,0,1,2,3,23,24,25,26,-1,-1,-1,11,12,13,14,15,16,17,0,1,2,3,-1,23,24,25,26,-1,-1,11,12,13,14,15,16,17,0,1,2,3,-1,23,24,25,26,-1,-1,11,12,13,14,15,16,17,0,1,2,3,-1,-1,24,25,26,-1,-1,11,12,13,14,15,16,17,0,1,2,3,-1,-1,-1,25,26,-1,-1,11,12,13,14,15,16,17,0,1,2,3,-1,-1,-1,-1,26,-1,-1,11,12,13,14,15,16,0,1,2,3,-1,-1,-1,-1,-1,26,-1,11,12,13,14,15,16,0,1,2,3,-1,-1,-1,-1,-1,26,-1,11,12,13,14,15,16,0,1,2,3,-1,0,1,2,3,26,-1,11,12,13,14,15,11,12,13,14,15,0,1,2,3,-1,26,0,1,2,3,26,11,12,13,14,15,-1,11,12,13,14,15,0,1,2,3,26,0,1,2,3,-1,26,11,12,13,14,15,11,12,13,14,15,0,1,2,3,-1,26,0,1,2,3,-1,11,12,13,14,-1,-1,11,12,13,14,0,1,2,3,0,1,2,3,-1,-1,-1,11,12,13,14,11,12,13,0,1,2,3,0,1,2,3,-1,-1,-1,11,12,13,-1,11,12,0,1,2,3,0,1,2,3,-1,-1,-1,11,12,-1,-1,11,12,0,1,2,3,-1,19,20,-1,-1,-1,24,11,26,-1,28,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	])

happyTable :: Happy_Data_Array.Array Int Int
happyTable = Happy_Data_Array.listArray (0,1104) ([0,122,120,112,92,28,107,120,28,113,114,33,34,115,94,112,35,121,36,132,37,113,121,59,31,91,151,60,98,-1,61,29,108,132,132,-1,-1,95,-1,33,34,-1,62,86,35,87,36,63,37,88,89,95,128,28,64,65,31,-1,59,28,123,112,60,131,-1,61,-1,113,123,122,127,-1,89,90,33,34,110,62,86,35,87,36,63,37,88,89,31,155,28,64,65,31,59,91,107,104,60,116,117,61,129,118,119,130,102,-1,89,155,33,34,31,62,86,35,87,36,63,37,88,89,-1,171,28,64,65,31,59,91,157,153,60,116,117,61,114,118,119,115,31,150,89,157,33,34,-1,62,86,35,87,36,63,37,88,89,137,-1,28,64,65,31,59,91,31,96,60,97,162,61,122,106,59,167,160,159,60,166,163,61,93,62,59,168,31,81,63,37,38,39,40,62,28,64,65,31,63,100,41,42,78,62,28,64,65,31,63,37,38,39,40,102,28,64,65,31,82,99,41,42,43,44,45,46,47,48,49,50,83,52,53,54,55,56,169,84,37,38,39,40,0,0,0,0,0,110,0,41,42,43,44,45,46,47,48,49,50,83,52,53,54,55,56,0,84,37,38,39,40,0,0,0,0,0,164,0,41,42,43,44,45,46,47,48,49,50,83,52,53,54,55,56,0,84,37,38,39,40,0,0,0,0,0,163,0,41,42,43,44,45,46,47,48,49,50,83,52,53,54,55,56,0,84,37,38,39,40,0,0,0,0,0,168,0,41,42,43,44,45,46,47,48,49,50,83,52,53,54,55,56,0,84,37,38,39,40,0,0,0,0,0,110,0,41,42,43,44,45,46,47,48,49,50,83,52,53,54,55,56,0,84,37,38,39,40,0,0,0,0,0,0,0,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,37,38,39,40,0,0,0,0,0,0,0,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,135,37,38,39,40,0,0,0,0,0,0,0,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,133,37,38,39,40,0,0,0,0,0,0,0,41,42,43,44,45,46,47,48,49,50,70,52,53,54,55,56,37,38,39,40,0,0,0,0,0,0,0,41,42,43,44,45,46,47,48,49,50,125,52,53,54,55,56,37,38,39,40,0,0,0,0,0,0,0,41,42,43,44,45,46,47,48,49,50,104,52,53,54,55,56,37,38,39,40,0,0,0,0,0,0,0,41,42,43,44,45,46,47,48,49,50,153,52,53,54,55,56,37,38,39,40,0,0,0,0,0,0,0,41,42,43,44,45,46,47,48,49,50,151,52,53,54,55,56,37,38,39,40,0,0,0,0,0,0,0,41,42,43,44,45,46,47,48,49,50,160,52,53,54,55,56,37,38,39,40,0,0,0,0,0,0,0,41,42,43,44,45,46,47,48,49,50,0,69,53,54,55,56,37,38,39,40,0,0,0,0,0,0,0,41,42,43,44,45,46,47,48,49,71,0,0,53,54,55,56,37,38,39,40,0,0,0,0,0,0,0,41,42,43,44,45,46,47,48,49,134,0,0,53,54,55,56,37,38,39,40,0,0,0,0,0,0,0,41,42,43,44,45,46,47,48,72,0,0,0,53,54,55,56,37,38,39,40,0,0,0,0,0,0,0,41,42,43,44,45,46,47,73,37,38,39,40,53,54,55,56,0,0,0,41,42,43,44,45,46,47,137,37,38,39,40,53,54,55,56,0,0,0,41,42,43,44,45,46,47,37,38,39,40,0,68,54,55,56,0,0,41,42,43,44,45,46,47,37,38,39,40,0,138,54,55,56,0,0,41,42,43,44,45,46,47,37,38,39,40,0,0,67,55,56,0,0,41,42,43,44,45,46,47,37,38,39,40,0,0,0,66,56,0,0,41,42,43,44,45,46,74,37,38,39,40,0,0,0,0,56,0,0,41,42,43,44,45,75,37,38,39,40,0,0,0,0,0,56,0,41,42,43,44,45,140,37,38,39,40,0,0,0,0,0,56,0,41,42,43,44,45,139,37,38,39,40,0,37,38,39,40,56,0,41,42,43,44,45,41,42,43,44,45,37,38,39,40,0,65,37,38,39,40,144,41,42,43,44,45,0,41,42,43,44,45,37,38,39,40,143,37,38,39,40,0,142,41,42,43,44,45,41,42,43,44,76,37,38,39,40,0,141,37,38,39,40,0,41,42,43,77,0,0,41,42,43,146,37,38,39,40,37,38,39,40,0,0,0,41,42,43,145,41,42,148,37,38,39,40,37,38,39,40,0,0,0,41,42,147,0,41,79,37,38,39,40,37,38,39,40,0,0,0,41,124,0,0,41,123,37,38,39,40,0,33,34,0,0,0,35,80,36,0,37,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

happyReduceArr = Happy_Data_Array.array (26, 97) [
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45),
	(46 , happyReduce_46),
	(47 , happyReduce_47),
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54),
	(55 , happyReduce_55),
	(56 , happyReduce_56),
	(57 , happyReduce_57),
	(58 , happyReduce_58),
	(59 , happyReduce_59),
	(60 , happyReduce_60),
	(61 , happyReduce_61),
	(62 , happyReduce_62),
	(63 , happyReduce_63),
	(64 , happyReduce_64),
	(65 , happyReduce_65),
	(66 , happyReduce_66),
	(67 , happyReduce_67),
	(68 , happyReduce_68),
	(69 , happyReduce_69),
	(70 , happyReduce_70),
	(71 , happyReduce_71),
	(72 , happyReduce_72),
	(73 , happyReduce_73),
	(74 , happyReduce_74),
	(75 , happyReduce_75),
	(76 , happyReduce_76),
	(77 , happyReduce_77),
	(78 , happyReduce_78),
	(79 , happyReduce_79),
	(80 , happyReduce_80),
	(81 , happyReduce_81),
	(82 , happyReduce_82),
	(83 , happyReduce_83),
	(84 , happyReduce_84),
	(85 , happyReduce_85),
	(86 , happyReduce_86),
	(87 , happyReduce_87),
	(88 , happyReduce_88),
	(89 , happyReduce_89),
	(90 , happyReduce_90),
	(91 , happyReduce_91),
	(92 , happyReduce_92),
	(93 , happyReduce_93),
	(94 , happyReduce_94),
	(95 , happyReduce_95),
	(96 , happyReduce_96),
	(97 , happyReduce_97)
	]

happy_n_terms = 38 :: Int
happy_n_nonterms = 30 :: Int

happyReduce_26 = happySpecReduce_1  0 happyReduction_26
happyReduction_26 (HappyTerminal (PT _ (TI happy_var_1)))
	 =  HappyAbsSyn29
		 ((read ( happy_var_1)) :: Integer
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  1 happyReduction_27
happyReduction_27 (HappyTerminal (PT _ (TD happy_var_1)))
	 =  HappyAbsSyn30
		 ((read ( happy_var_1)) :: Double
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  2 happyReduction_28
happyReduction_28 (HappyTerminal (PT _ (TL happy_var_1)))
	 =  HappyAbsSyn31
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  3 happyReduction_29
happyReduction_29 (HappyTerminal (PT _ (T_Id happy_var_1)))
	 =  HappyAbsSyn32
		 (Id (happy_var_1)
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  4 happyReduction_30
happyReduction_30 (HappyAbsSyn35  happy_var_1)
	 =  HappyAbsSyn33
		 (AbsCpp.PDefs (reverse happy_var_1)
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happyReduce 8 5 happyReduction_31
happyReduction_31 (_ `HappyStk`
	(HappyAbsSyn39  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn37  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn32  happy_var_2) `HappyStk`
	(HappyAbsSyn57  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn34
		 (AbsCpp.DFun happy_var_1 happy_var_2 happy_var_4 (reverse happy_var_7)
	) `HappyStk` happyRest

happyReduce_32 = happySpecReduce_0  6 happyReduction_32
happyReduction_32  =  HappyAbsSyn35
		 ([]
	)

happyReduce_33 = happySpecReduce_2  6 happyReduction_33
happyReduction_33 (HappyAbsSyn34  happy_var_2)
	(HappyAbsSyn35  happy_var_1)
	 =  HappyAbsSyn35
		 (flip (:) happy_var_1 happy_var_2
	)
happyReduction_33 _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_2  7 happyReduction_34
happyReduction_34 (HappyAbsSyn32  happy_var_2)
	(HappyAbsSyn57  happy_var_1)
	 =  HappyAbsSyn36
		 (AbsCpp.ADecl happy_var_1 happy_var_2
	)
happyReduction_34 _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_0  8 happyReduction_35
happyReduction_35  =  HappyAbsSyn37
		 ([]
	)

happyReduce_36 = happySpecReduce_1  8 happyReduction_36
happyReduction_36 (HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn37
		 ((:[]) happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  8 happyReduction_37
happyReduction_37 (HappyAbsSyn37  happy_var_3)
	_
	(HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn37
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_2  9 happyReduction_38
happyReduction_38 _
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn38
		 (AbsCpp.SExp happy_var_1
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  9 happyReduction_39
happyReduction_39 _
	(HappyAbsSyn58  happy_var_2)
	(HappyAbsSyn57  happy_var_1)
	 =  HappyAbsSyn38
		 (AbsCpp.SDecls happy_var_1 happy_var_2
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happyReduce 5 9 happyReduction_40
happyReduction_40 (_ `HappyStk`
	(HappyAbsSyn40  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn32  happy_var_2) `HappyStk`
	(HappyAbsSyn57  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn38
		 (AbsCpp.SInit happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_41 = happySpecReduce_3  9 happyReduction_41
happyReduction_41 _
	(HappyAbsSyn40  happy_var_2)
	_
	 =  HappyAbsSyn38
		 (AbsCpp.SReturn happy_var_2
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_2  9 happyReduction_42
happyReduction_42 _
	_
	 =  HappyAbsSyn38
		 (AbsCpp.SReturnVoid
	)

happyReduce_43 = happyReduce 5 9 happyReduction_43
happyReduction_43 ((HappyAbsSyn38  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn40  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn38
		 (AbsCpp.SWhile happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_44 = happySpecReduce_3  9 happyReduction_44
happyReduction_44 _
	(HappyAbsSyn39  happy_var_2)
	_
	 =  HappyAbsSyn38
		 (AbsCpp.SBlock (reverse happy_var_2)
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happyReduce 7 9 happyReduction_45
happyReduction_45 ((HappyAbsSyn38  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn38  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn40  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn38
		 (AbsCpp.SIfElse happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_46 = happySpecReduce_0  10 happyReduction_46
happyReduction_46  =  HappyAbsSyn39
		 ([]
	)

happyReduce_47 = happySpecReduce_2  10 happyReduction_47
happyReduction_47 (HappyAbsSyn38  happy_var_2)
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn39
		 (flip (:) happy_var_1 happy_var_2
	)
happyReduction_47 _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  11 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn40
		 (AbsCpp.ETrue
	)

happyReduce_49 = happySpecReduce_1  11 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn40
		 (AbsCpp.EFalse
	)

happyReduce_50 = happySpecReduce_1  11 happyReduction_50
happyReduction_50 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn40
		 (AbsCpp.EInt happy_var_1
	)
happyReduction_50 _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_1  11 happyReduction_51
happyReduction_51 (HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn40
		 (AbsCpp.EDouble happy_var_1
	)
happyReduction_51 _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_1  11 happyReduction_52
happyReduction_52 (HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn40
		 (AbsCpp.EString happy_var_1
	)
happyReduction_52 _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_1  11 happyReduction_53
happyReduction_53 (HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn40
		 (AbsCpp.EId happy_var_1
	)
happyReduction_53 _  = notHappyAtAll 

happyReduce_54 = happyReduce 4 11 happyReduction_54
happyReduction_54 (_ `HappyStk`
	(HappyAbsSyn56  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn32  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn40
		 (AbsCpp.EApp happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_55 = happySpecReduce_3  11 happyReduction_55
happyReduction_55 _
	(HappyAbsSyn40  happy_var_2)
	_
	 =  HappyAbsSyn40
		 (happy_var_2
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_2  12 happyReduction_56
happyReduction_56 _
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (AbsCpp.EPIncr happy_var_1
	)
happyReduction_56 _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_2  12 happyReduction_57
happyReduction_57 _
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (AbsCpp.EPDecr happy_var_1
	)
happyReduction_57 _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  12 happyReduction_58
happyReduction_58 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_2  13 happyReduction_59
happyReduction_59 (HappyAbsSyn40  happy_var_2)
	_
	 =  HappyAbsSyn40
		 (AbsCpp.EIncr happy_var_2
	)
happyReduction_59 _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_2  13 happyReduction_60
happyReduction_60 (HappyAbsSyn40  happy_var_2)
	_
	 =  HappyAbsSyn40
		 (AbsCpp.EDecr happy_var_2
	)
happyReduction_60 _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  13 happyReduction_61
happyReduction_61 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (happy_var_1
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  14 happyReduction_62
happyReduction_62 (HappyAbsSyn40  happy_var_3)
	_
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (AbsCpp.ETimes happy_var_1 happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  14 happyReduction_63
happyReduction_63 (HappyAbsSyn40  happy_var_3)
	_
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (AbsCpp.EDiv happy_var_1 happy_var_3
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_1  14 happyReduction_64
happyReduction_64 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (happy_var_1
	)
happyReduction_64 _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  15 happyReduction_65
happyReduction_65 (HappyAbsSyn40  happy_var_3)
	_
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (AbsCpp.EPlus happy_var_1 happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_3  15 happyReduction_66
happyReduction_66 (HappyAbsSyn40  happy_var_3)
	_
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (AbsCpp.EMinus happy_var_1 happy_var_3
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_1  15 happyReduction_67
happyReduction_67 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (happy_var_1
	)
happyReduction_67 _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_3  16 happyReduction_68
happyReduction_68 (HappyAbsSyn40  happy_var_3)
	_
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (AbsCpp.ELt happy_var_1 happy_var_3
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_3  16 happyReduction_69
happyReduction_69 (HappyAbsSyn40  happy_var_3)
	_
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (AbsCpp.EGt happy_var_1 happy_var_3
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_3  16 happyReduction_70
happyReduction_70 (HappyAbsSyn40  happy_var_3)
	_
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (AbsCpp.ELtEq happy_var_1 happy_var_3
	)
happyReduction_70 _ _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_3  16 happyReduction_71
happyReduction_71 (HappyAbsSyn40  happy_var_3)
	_
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (AbsCpp.EGtEq happy_var_1 happy_var_3
	)
happyReduction_71 _ _ _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_1  16 happyReduction_72
happyReduction_72 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (happy_var_1
	)
happyReduction_72 _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_3  17 happyReduction_73
happyReduction_73 (HappyAbsSyn40  happy_var_3)
	_
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (AbsCpp.EEq happy_var_1 happy_var_3
	)
happyReduction_73 _ _ _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_3  17 happyReduction_74
happyReduction_74 (HappyAbsSyn40  happy_var_3)
	_
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (AbsCpp.ENEq happy_var_1 happy_var_3
	)
happyReduction_74 _ _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_1  17 happyReduction_75
happyReduction_75 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (happy_var_1
	)
happyReduction_75 _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_3  18 happyReduction_76
happyReduction_76 (HappyAbsSyn40  happy_var_3)
	_
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (AbsCpp.EAnd happy_var_1 happy_var_3
	)
happyReduction_76 _ _ _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_1  18 happyReduction_77
happyReduction_77 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (happy_var_1
	)
happyReduction_77 _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_3  19 happyReduction_78
happyReduction_78 (HappyAbsSyn40  happy_var_3)
	_
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (AbsCpp.EOr happy_var_1 happy_var_3
	)
happyReduction_78 _ _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_1  19 happyReduction_79
happyReduction_79 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (happy_var_1
	)
happyReduction_79 _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_3  20 happyReduction_80
happyReduction_80 (HappyAbsSyn40  happy_var_3)
	_
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (AbsCpp.EAss happy_var_1 happy_var_3
	)
happyReduction_80 _ _ _  = notHappyAtAll 

happyReduce_81 = happySpecReduce_1  20 happyReduction_81
happyReduction_81 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (happy_var_1
	)
happyReduction_81 _  = notHappyAtAll 

happyReduce_82 = happySpecReduce_1  21 happyReduction_82
happyReduction_82 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (happy_var_1
	)
happyReduction_82 _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_1  22 happyReduction_83
happyReduction_83 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (happy_var_1
	)
happyReduction_83 _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_1  23 happyReduction_84
happyReduction_84 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (happy_var_1
	)
happyReduction_84 _  = notHappyAtAll 

happyReduce_85 = happySpecReduce_1  24 happyReduction_85
happyReduction_85 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (happy_var_1
	)
happyReduction_85 _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_1  25 happyReduction_86
happyReduction_86 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (happy_var_1
	)
happyReduction_86 _  = notHappyAtAll 

happyReduce_87 = happySpecReduce_1  26 happyReduction_87
happyReduction_87 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (happy_var_1
	)
happyReduction_87 _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_0  27 happyReduction_88
happyReduction_88  =  HappyAbsSyn56
		 ([]
	)

happyReduce_89 = happySpecReduce_1  27 happyReduction_89
happyReduction_89 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn56
		 ((:[]) happy_var_1
	)
happyReduction_89 _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_3  27 happyReduction_90
happyReduction_90 (HappyAbsSyn56  happy_var_3)
	_
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn56
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_90 _ _ _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_1  28 happyReduction_91
happyReduction_91 _
	 =  HappyAbsSyn57
		 (AbsCpp.Type_bool
	)

happyReduce_92 = happySpecReduce_1  28 happyReduction_92
happyReduction_92 _
	 =  HappyAbsSyn57
		 (AbsCpp.Type_int
	)

happyReduce_93 = happySpecReduce_1  28 happyReduction_93
happyReduction_93 _
	 =  HappyAbsSyn57
		 (AbsCpp.Type_double
	)

happyReduce_94 = happySpecReduce_1  28 happyReduction_94
happyReduction_94 _
	 =  HappyAbsSyn57
		 (AbsCpp.Type_void
	)

happyReduce_95 = happySpecReduce_1  28 happyReduction_95
happyReduction_95 _
	 =  HappyAbsSyn57
		 (AbsCpp.Type_string
	)

happyReduce_96 = happySpecReduce_1  29 happyReduction_96
happyReduction_96 (HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn58
		 ((:[]) happy_var_1
	)
happyReduction_96 _  = notHappyAtAll 

happyReduce_97 = happySpecReduce_3  29 happyReduction_97
happyReduction_97 (HappyAbsSyn58  happy_var_3)
	_
	(HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn58
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_97 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	happyDoAction 37 notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = happyDoAction i tk action sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 1;
	PT _ (TS _ 2) -> cont 2;
	PT _ (TS _ 3) -> cont 3;
	PT _ (TS _ 4) -> cont 4;
	PT _ (TS _ 5) -> cont 5;
	PT _ (TS _ 6) -> cont 6;
	PT _ (TS _ 7) -> cont 7;
	PT _ (TS _ 8) -> cont 8;
	PT _ (TS _ 9) -> cont 9;
	PT _ (TS _ 10) -> cont 10;
	PT _ (TS _ 11) -> cont 11;
	PT _ (TS _ 12) -> cont 12;
	PT _ (TS _ 13) -> cont 13;
	PT _ (TS _ 14) -> cont 14;
	PT _ (TS _ 15) -> cont 15;
	PT _ (TS _ 16) -> cont 16;
	PT _ (TS _ 17) -> cont 17;
	PT _ (TS _ 18) -> cont 18;
	PT _ (TS _ 19) -> cont 19;
	PT _ (TS _ 20) -> cont 20;
	PT _ (TS _ 21) -> cont 21;
	PT _ (TS _ 22) -> cont 22;
	PT _ (TS _ 23) -> cont 23;
	PT _ (TS _ 24) -> cont 24;
	PT _ (TS _ 25) -> cont 25;
	PT _ (TS _ 26) -> cont 26;
	PT _ (TS _ 27) -> cont 27;
	PT _ (TS _ 28) -> cont 28;
	PT _ (TS _ 29) -> cont 29;
	PT _ (TS _ 30) -> cont 30;
	PT _ (TS _ 31) -> cont 31;
	PT _ (TS _ 32) -> cont 32;
	PT _ (TI happy_dollar_dollar) -> cont 33;
	PT _ (TD happy_dollar_dollar) -> cont 34;
	PT _ (TL happy_dollar_dollar) -> cont 35;
	PT _ (T_Id happy_dollar_dollar) -> cont 36;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 37 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

happyThen :: () => Err a -> (a -> Err b) -> Err b
happyThen = (thenM)
happyReturn :: () => a -> Err a
happyReturn = (returnM)
happyThen1 m k tks = (thenM) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Err a
happyReturn1 = \a tks -> (returnM) a
happyError' :: () => ([(Token)], [String]) -> Err a
happyError' = (\(tokens, _) -> happyError tokens)
pProgram tks = happySomeParser where
 happySomeParser = happyThen (happyParse 0 tks) (\x -> case x of {HappyAbsSyn33 z -> happyReturn z; _other -> notHappyAtAll })

pDef tks = happySomeParser where
 happySomeParser = happyThen (happyParse 1 tks) (\x -> case x of {HappyAbsSyn34 z -> happyReturn z; _other -> notHappyAtAll })

pListDef tks = happySomeParser where
 happySomeParser = happyThen (happyParse 2 tks) (\x -> case x of {HappyAbsSyn35 z -> happyReturn z; _other -> notHappyAtAll })

pArg tks = happySomeParser where
 happySomeParser = happyThen (happyParse 3 tks) (\x -> case x of {HappyAbsSyn36 z -> happyReturn z; _other -> notHappyAtAll })

pListArg tks = happySomeParser where
 happySomeParser = happyThen (happyParse 4 tks) (\x -> case x of {HappyAbsSyn37 z -> happyReturn z; _other -> notHappyAtAll })

pStm tks = happySomeParser where
 happySomeParser = happyThen (happyParse 5 tks) (\x -> case x of {HappyAbsSyn38 z -> happyReturn z; _other -> notHappyAtAll })

pListStm tks = happySomeParser where
 happySomeParser = happyThen (happyParse 6 tks) (\x -> case x of {HappyAbsSyn39 z -> happyReturn z; _other -> notHappyAtAll })

pExp15 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 7 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pExp14 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 8 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pExp13 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 9 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pExp12 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 10 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pExp11 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 11 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pExp9 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 12 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pExp8 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 13 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pExp4 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 14 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pExp3 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 15 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pExp2 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 16 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse 17 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pExp1 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 18 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pExp5 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 19 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pExp6 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 20 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pExp7 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 21 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pExp10 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 22 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pListExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse 23 tks) (\x -> case x of {HappyAbsSyn56 z -> happyReturn z; _other -> notHappyAtAll })

pType tks = happySomeParser where
 happySomeParser = happyThen (happyParse 24 tks) (\x -> case x of {HappyAbsSyn57 z -> happyReturn z; _other -> notHappyAtAll })

pListId tks = happySomeParser where
 happySomeParser = happyThen (happyParse 25 tks) (\x -> case x of {HappyAbsSyn58 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 17 "<built-in>" #-}
{-# LINE 1 "/Users/justinbindi/.ghcup/ghc/8.6.5/lib/ghc-8.6.5/include/ghcversion.h" #-}
















{-# LINE 18 "<built-in>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 










{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList








{-# LINE 65 "templates/GenericTemplate.hs" #-}


{-# LINE 75 "templates/GenericTemplate.hs" #-}



happyTrace string expr = Happy_System_IO_Unsafe.unsafePerformIO $ do
    Happy_System_IO.hPutStr Happy_System_IO.stderr string
    return expr




infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (0), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (0) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = (happyTrace ("state: " ++ show (st) ++ 
                      
{-# LINE 110 "templates/GenericTemplate.hs" #-}
          ",\ttoken: " ++ show (i) ++
                      
{-# LINE 110 "templates/GenericTemplate.hs" #-}
          ",\taction: ")) $
          

          case action of
                (0)           -> (happyTrace ("fail.\n")) $
                                     happyFail (happyExpListPerState ((st) :: Int)) i tk st
                (-1)          -> (happyTrace ("accept.\n")) $
                                     happyAccept i tk st
                n | (n < ((0) :: Int)) -> (happyTrace ("reduce (rule " ++ show rule
                                                               
{-# LINE 118 "templates/GenericTemplate.hs" #-}
                                                   ++ ")")) $
                                                   
                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = ((negate ((n + ((1) :: Int)))))
                n                 -> (happyTrace ("shift, enter state "
                                                 
{-# LINE 122 "templates/GenericTemplate.hs" #-}
                                     ++ show (new_state)
                                                 
{-# LINE 122 "templates/GenericTemplate.hs" #-}
                                     ++ "\n")) $
                                     

                                     happyShift new_state i tk st
                                     where new_state = (n - ((1) :: Int))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off +  i)
         check  = if (off_i >= ((0) :: Int))
                  then (indexShortOffAddr happyCheck off_i ==  i)
                  else False
         action
          | check     = indexShortOffAddr happyTable off_i
          | otherwise = indexShortOffAddr happyDefActions st




{-# LINE 147 "templates/GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)


{-# LINE 180 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (0) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (0) tk st sts stk
     = happyFail [] (0) tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (0) tk st sts stk
     = happyFail [] (0) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (0) tk st sts stk
     = happyFail [] (0) tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (0) tk st sts stk
     = happyFail [] (0) tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (0) tk st sts stk
     = happyFail [] (0) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn (0) tk st sts stk
     = happyFail [] (0) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (0) tk st sts stk
     = happyFail [] (0) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off +  nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   (happyTrace (", goto state " ++ show (new_state) ++ "\n")) $
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off +  nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery ((0) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (0) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (0) tk old_st (HappyCons ((action)) (sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        happyDoAction (0) tk action sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction (0) tk action sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.

