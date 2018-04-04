module Model exposing (Model, init)

import Navigation exposing (Location)


--

import Router exposing (Screen(..), screenFromLocation)
import First.Model
import Second.Model
import Third.Model


type alias Model =
    { globalCounter : Int
    , screen : Screen
    , first : First.Model.Model
    , second : Second.Model.Model
    , third : Third.Model.Model
    }


init : Location -> Model
init location =
    { screen = screenFromLocation location
    , globalCounter = 0
    , first = First.Model.init
    , second = Second.Model.init
    , third = Third.Model.init
    }
