module Components.Hello exposing (hello)

import Html exposing (..)
import Html.Attributes exposing (..)
import String

repeat : String -> a -> String
repeat str model = str
  |> String.repeat model.count

-- hello component
hello : Int -> Html a
hello model =
  div
    [ class "h1" ]
    [ text ( "Hi" ++ (repeat "repeat" model) ++ " " ++ toString model.count ) ]
    -- [ text model ]
