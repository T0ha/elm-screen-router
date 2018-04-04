module Main exposing (..)

import Navigation
import View
import Update
import Model exposing (Model)


main =
    Navigation.program
        Update.ChangeLocation
        { init = init
        , view = View.view
        , update = Update.update
        , subscriptions = (\_ -> Sub.none)
        }


init : Navigation.Location -> ( Model, Cmd Update.Msg )
init location =
    Model.init location
        ! []
