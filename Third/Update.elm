module Third.Update exposing (..)

import Model exposing (Model)


type Msg
    = Reset
    | IncrementCounter


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        IncrementCounter ->
            let
                counter =
                    model.third.counter

                third =
                    model.third
            in
                { model
                    | globalCounter = model.globalCounter + 1
                    , third = { third | counter = counter + 1 }
                }
                    ! []

        _ ->
            model ! []
