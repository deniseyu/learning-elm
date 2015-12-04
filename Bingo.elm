module Bingo where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import String exposing (toUpper, repeat, trimRight)

-- defining functions
-- FUNCTION arg1 arg2 etc.
title message times =
  message ++ " "  -- "bingo "
  |> toUpper -- "BINGO " 
  |> repeat times  -- "BINGO BINGO BINGO "
  |> trimRight
  |> text

pageHeader =
  h1 [ ] [ title "hello" 5 ]

pageFooter = 
  footer [ ]
    [ a 
      [ href "https://www.mergermarket.com" ] 
      [ text "MM" ] 
    ]

entryList =
  ul [ ]
   [ entryItem "Future-Proof" 100,
      entryItem "Doing Stuff" 200
   ]

entryItem phrase points =
  li [ ]
    [ span [ class "phlsdkfrase" ] [ text phrase ],
      span [ class "points" ] [ text (toString points) ]
    ]

main =
  -- title "hello" 5
  -- Html.text (String.reverse (String.repeat 3 (String.toUpper "bingo")))
  div [ id "container" ] [ pageHeader, entryList, pageFooter ]
