module First.Update exposing (..)

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
                    model.first.counter

                first =
                    model.first
            in
                { model
                    | globalCounter = model.globalCounter + 1
                    , first = { first | counter = counter + 1 }
                }
                    ! []

        _ ->
            model ! []
