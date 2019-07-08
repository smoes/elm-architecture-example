module TextInput exposing (..)

import Html exposing (Html, Attribute, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


type TextMessage =
    Changed String

type alias TextModel
    = String

init = ""

view : TextModel -> String -> Html TextMessage
view model placeholderStr =
    input [ placeholder placeholderStr, value model, onInput Changed ] []


update : TextMessage -> TextModel -> TextModel
update msg model =
    case msg of
        Changed content ->
            content
