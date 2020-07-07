module Smileyfy exposing (..)
import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

-- MAIN
main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL
type alias Model =
  { content : String,
    smiley : String
  }


init : Model
init =
  { content = "",
    smiley = ""
  }

-- UPDATE
type Msg
  = Change String |
    Change_Smiley String

--update : Msg
update : Msg -> Model -> Model
update msg model =
  case msg of
    Change new_content ->
      { model |
        content = new_content}
    Change_Smiley new_smiley ->
      { model |
        smiley = new_smiley}


-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Text to Smileyfy", value model.content, onInput Change ] []
    , input [ placeholder "Smiley", value model.smiley, onInput Change_Smiley] []
    , div [] [if model.content == "" then text "" else text (String.concat [model.smiley, " ", model.content, " ", model.smiley]) ]
    ]
