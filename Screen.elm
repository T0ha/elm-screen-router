module Screen exposing (..)

import Html exposing (Html, text)
import Material
import Material.Layout as Layout
import Material.Badge as Badge
import Material.Icon as Icon
import Material.Options as Options exposing (cs, css, Property)
import Material.Color as Color
import Material.Button as Button


--

import Update exposing (Msg(..), wrapScreen)
import Model exposing (Model)
import Router


type alias Render =
    Model -> List (Html Msg)


defaultLayout : Model -> Render -> Render -> Html Msg
defaultLayout model drawer viewBody =
    Layout.render Mdl
        model.mdl
        [ Layout.fixedHeader
        ]
        { header = [ viewHeader model ]
        , drawer = drawer model
        , tabs = ( viewTabs model, [ css "cursor" "pointer" ] )
        , main = viewBody model
        }


viewHeader : Model -> Html Msg
viewHeader model =
    Layout.row
        []
        [ Layout.title []
            [ text <| Router.header model.screen ]
        , Layout.navigation []
            []
        ]


viewTabs : Model -> List (Html msg)
viewTabs model =
    []


drawerHeader : Model -> String -> Html Msg
drawerHeader model header =
    Options.styled Html.header
        [ css "display" "flex"
        , css "box-sizing" "border-box"
        , css "justify-content" "flex-end"
        , css "padding" "16px"
        , css "flex-direction" "column"
        , cs "demo-header"
        ]
        [ Options.styled Html.div
            [ css "display" "flex"
            , css "flex-direction" "row"
            , css "align-items" "center"
            , css "width" "100%"
            , css "position" "relative"
            ]
            [ Layout.title [] [ text header ]
            , Layout.spacer
            ]
        ]


viewDrawer : List (Html msg) -> Html msg
viewDrawer elements =
    Layout.navigation
        []
    <|
        elements


drawerElements : Render
drawerElements model =
    let
        screenLink { screen } =
            Layout.link
                [ Layout.href <| Router.url screen
                ]
                [ text <| Router.header screen
                ]
    in
        List.map screenLink Router.screens


empty : Model -> List (Html msg)
empty _ =
    []
