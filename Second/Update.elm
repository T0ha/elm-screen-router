module Second.Update exposing (..)

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
                    model.second.counter

                second =
                    model.second
            in
                { model
                    | globalCounter = model.globalCounter + 1
                    , second = { second | counter = counter + 1 }
                }
                    ! []

        _ ->
            model ! []
