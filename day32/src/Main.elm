-- cerner_2tothe5th_2021
-- See you again
-- How to run?
--   > cd src
--   > elm make Main.elm
--   open index.html

module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

view =
    img [src "../images/see_you_again.png", width 1440, height 1000] []

main =
    view
