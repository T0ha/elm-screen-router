module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (Model)
import Update exposing (Msg)
import Router exposing (Screen(..))
import First.View
import Second.View
import Third.View


type Align
    = Left
    | Right
    | Center


view model =
    case model.screen of
        Main ->
            div
                [ style [ ( "border", "#000 1px solid" ) ]
                ]
                [ firstLink
                , secondLink
                , thirdLink
                , copyright
                ]

        First ->
            wrapScreen Update.FirstEvent <| First.View.view model

        Second ->
            wrapScreen Update.SecondEvent <| Second.View.view model

        Third ->
            wrapScreen Update.ThirdEvent <| Third.View.view model


logo : Html Msg
logo =
    block Center
        [ img
            [ src "/static/img/logo_full.png"
            , style
                [ ( "width", "100%" ) ]
            ]
            []
        ]


backLink : Html Msg
backLink =
    block
        Left
        [ a [ href <| Router.url Main ] [ text "< Back" ]
        ]


firstLink : Html Msg
firstLink =
    block
        Center
        [ a [ href <| Router.url First ] [ text "First" ]
        ]


thirdLink : Html Msg
thirdLink =
    block
        Center
        [ a [ href <| Router.url Third ] [ text "Third" ]
        ]


secondLink : Html Msg
secondLink =
    block
        Center
        [ a [ href <| Router.url Second ] [ text "Second" ]
        ]


copyright : Html Msg
copyright =
    block Right [ text "© 2018 Anton Shvein aka war1and" ]


block : Align -> List (Html Msg) -> Html Msg
block align elements =
    let
        textAlign =
            case align of
                Left ->
                    "left"

                Right ->
                    "right"

                Center ->
                    "center"
    in
        div
            [ style
                [ ( "width", "80%" )
                , ( "margin", "10%" )
                , ( "text-align", textAlign )
                ]
            ]
            elements


wrapScreen : (msg -> Msg) -> Html msg -> Html Msg
wrapScreen =
    Html.map
