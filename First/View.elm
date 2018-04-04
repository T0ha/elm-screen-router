module First.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Model)
import First.Update exposing (Msg(..))
import Router exposing (Screen(..))


view : Model -> Html Msg
view model =
    div []
        [ a [ href <| Router.url Main ] [ text "< Back" ]
        , h1 [] [ text "First Screen" ]
        , div []
            [ text "Button pushed in this screen: "
            , text <| toString model.first.counter
            ]
        , div []
            [ text "Button pushed in all screens: "
            , text <| toString model.globalCounter
            ]
        , div []
            [ button [ onClick IncrementCounter ] [ text "++" ]
            ]
        ]
