module Bingo where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import StartApp.Simple as StartApp

import String exposing (toUpper, repeat, trimRight)

-- DATAs
newEntry phrase points id =
  { phrase = phrase, -- indentation, fool
    points = points,
    wasSpoken = False,
    id = id
  }

initialModel =
  { entries = [
    newEntry "derp" 200 1,
    newEntry "wow" 300 1,
    newEntry "much elm" 100 1,
    newEntry "elm is cool" 500 1,
    newEntry "very view" 400 4
    ]
  }

-- UPDATES

type Action  -- actions are data types
  = NoOp    -- just declaring stuff here, no behavior defined yet
  | Sort    -- compiler will complain if declare here but not defined in update

update action model = -- stateless!
  case action of
    NoOp ->
      model
    Sort ->
      { model | entries = List.sortBy .points model.entries }


-- VIEW STUFF STARTS HERE

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

entryList entries =
  ul [ ] (List.map entryItem entries)

entryItem entry =
  li [ ]
  [ span [ class "phrase" ] [ text entry.phrase ],
    span [ class "points" ] [ text (toString entry.points) ]
  ]

view address model =
  div [ id "container" ] 
  [ pageHeader, 
  entryList model.entries, 
  button 
    [ class "sort", onClick address Sort ] -- bind event handler
    [ text "omg i'm a button" ], -- sends Sort to address on click event
  pageFooter ]

-- wire it all together

main =
  -- view (update NoOp initialModel)
  --initialModel
   -- |> update Sort
    --|> view

  StartApp.start
  { model = initialModel,
    view = view,
    update = update
  }
