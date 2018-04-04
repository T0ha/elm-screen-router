module Second.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


--

import Model exposing (Model)
import Router exposing (Screen(..))
import Second.Update exposing (Msg(..))


view : Model -> Html Msg
view model =
    div []
        [ a [ href <| Router.url Main ] [ text "< Back" ]
        , h1 [] [ text "Second Screen" ]
        , div []
            [ text "Button pushed in this screen: "
            , text <| toString model.second.counter
            ]
        , div []
            [ text "Button pushed in all screens: "
            , text <| toString model.globalCounter
            ]
        , div []
            [ button [ onClick IncrementCounter ] [ text "++" ]
            ]
        ]
