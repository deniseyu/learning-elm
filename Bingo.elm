module Bingo where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import String exposing (toUpper, repeat, trimRight)

newEntry phrase points id = -- a data object
  { phrase = phrase,
    points = points,
    wasSpoken = False,
    id = id
  }

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
   [ 
     entryItem (newEntry "Future Stuff" 100 1),
     entryItem (newEntry "Old stuff" 200 1)
   ]

entryItem entry =
  li [ ]
    [ span [ class "phrase" ] [ text entry.phrase ],
      span [ class "points" ] [ text (toString entry.points) ]
    ]

main =
  -- title "hello" 5
  -- Html.text (String.reverse (String.repeat 3 (String.toUpper "bingo")))
  div [ id "container" ] 
    [ pageHeader, 
      entryList, 
      pageFooter ]
