module Form exposing (..)

import Html exposing (Html, Attribute, text, div, button)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import TextInput


type FormMessage =
      NameChanged TextInput.TextMessage
    | EMailChanged TextInput.TextMessage
    | Submitted


type alias FormModel =
    { name  : TextInput.TextModel
    , email : TextInput.TextModel
    }


init : FormModel
init = { name = TextInput.init
       , email = TextInput.init
       }


view : FormModel -> Html FormMessage
view model =
    div []
        [ Html.map NameChanged  (TextInput.view model.name "Name")
        , Html.map EMailChanged (TextInput.view model.email "E-Mail")
        , button [ onClick Submitted ] [ text "Submit"]
        ]


update : FormMessage -> FormModel -> FormModel
update msg model =
    case msg of
        NameChanged nameMsg ->
            {model | name = (TextInput.update nameMsg model.name)}
        EMailChanged emailMsg ->
            {model | email = (TextInput.update emailMsg model.email)}
        Submitted -> model

