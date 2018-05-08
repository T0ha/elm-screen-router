module First.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Material.Button as Button
import Material.Options as Options
import Material.Icon as Icon


---

import Model exposing (Model)
import First.Update exposing (Msg(..))
import Router exposing (Screen(..))


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ text "Button pushed in this screen: "
            , text <| toString model.first.counter
            ]
        , div []
            [ text "Button pushed in all screens: "
            , text <| toString model.globalCounter
            ]
        , div []
            [ Button.render
                Mdl
                [ 0 ]
                model.mdl
                [ Button.fab
                , Button.colored
                , Options.onClick
                    IncrementCounter
                ]
                [ Icon.i "add" ]
            ]
        ]
