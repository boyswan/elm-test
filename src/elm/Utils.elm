module Utils exposing (..)


-- isNegative : Int -> String -> Html msg
-- isNegative model className =
--   let
--     (message, color) =
--       if model < 0 then
--         ("negative", "red")
--       else if model == 0 then
--         ("neutral", "orange")
--       else
--         ("positive", "green")
--   in
--     div [ class className, style [("color", color)] ] [ text message ]


getStatus : Int -> (String, String)
getStatus model =
  if model < 0 then
    ("negative", "red")
  else if model == 0 then
    ("neutral", "orange")
  else
    ("positive", "green")
