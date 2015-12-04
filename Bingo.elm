module Bingo where

import Html
import String

-- defining functions
-- FUNCTION arg1 arg2 etc.
title message times =
  message ++ " "  -- "bingo "
  |> String.toUpper -- "BINGO " 
  |> String.repeat times  -- "BINGO BINGO BINGO "
  |> Html.text

main =
  title "🚀🎉🎂🎵🇺🇸" 5
  -- Html.text (String.reverse (String.repeat 3 (String.toUpper "bingo")))
