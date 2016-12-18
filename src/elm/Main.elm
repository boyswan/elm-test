import Html exposing (..)
import Html.Events exposing (onClick)
import Html exposing (..)
import Html.Attributes exposing (..)

import Utils exposing (getStatus)

main : Program Never Model Msg
main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias Model =
  { count: Int
  , test: String
  }

model : Model
model =
  { count = 0
  , test = ""
  }

-- UPDATE
type Msg
  = Increment
  | Decrement
  | Reset

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      { model | count = model.count + 1}
    Decrement ->
      { model | count = model.count - 1}
    Reset ->
      { model | count = 0}

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model.count) ]
    , button [ onClick Increment ] [ text "+" ]
    , button [ onClick Reset ] [ text "Reset" ],
    showWarning model
    ]


showWarning : Model -> Html msg
showWarning model =
  let
    (message, color) = getStatus model.count
  in
    div [ class "example_class", style [("color", color)] ] [ text message ]
