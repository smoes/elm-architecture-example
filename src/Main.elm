module Main exposing (..)

import Browser
import Html exposing (Html, span, text, div)
import Html.Attributes exposing (class)
import TextInput
import Form

main =
  Browser.sandbox { init = init, update = update, view = view }

type alias FormData =
    { name : String
    , email : String
    }




formModelToData : Form.FormModel -> FormData
formModelToData  model = model


type alias Model =
    { form : Form.FormModel
    , submitted : Maybe FormData
    }


type alias Msg = Form.FormMessage


init : Model
init = { form = Form.init
       , submitted = Nothing
       }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Form.Submitted ->
            { form = Form.init
            , submitted = Just(formModelToData model.form)}
        formMsg -> { model | form = Form.update formMsg model.form }



view : Model -> Html Msg
view model =
    div []
        [ Form.view model.form
        , case model.submitted of
              Just data -> span [] [ text ("Submitted: " ++ data.name ++ " " ++ data.email)]
              Nothing -> span [] [ text "No data" ]
        ]
