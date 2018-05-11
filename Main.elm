module Main exposing (..)

import Navigation
import Material


--

import View
import Update
import Subscription
import Model exposing (Model)


main =
    Navigation.program
        Update.ChangeLocation
        { init = init
        , view = View.view
        , update = Update.update
        , subscriptions = Subscription.subscriptions
        }


init : Navigation.Location -> ( Model, Cmd Update.Msg )
init location =
    Model.init location
        ! [ Material.init Update.Mdl ]
