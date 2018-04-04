module Router exposing (Screen(..), screenFromLocation, url)

import Navigation exposing (Location)


type Screen
    = Main
    | First
    | Third
    | Second


type alias Route =
    { screen : Screen
    , url : String
    }


screens : List ( Screen, String )
screens =
    [ ( Main, "" )
    , ( First, "first" )
    , ( Second, "second" )
    , ( Third, "third" )
    ]


screenFromLocation : Location -> Screen
screenFromLocation location =
    let
        isCurrent ( screen, hash ) =
            "#" ++ hash == (Debug.log "location" location.hash)

        screenList =
            List.filter isCurrent screens
    in
        case screenList of
            [ ( screen, _ ) ] ->
                screen

            _ ->
                Main


url : Screen -> String
url screen =
    let
        isCurrent ( s, l ) =
            if s == screen then
                Just l
            else
                Nothing

        urls =
            List.filterMap isCurrent screens
    in
        case urls of
            [ u ] ->
                "#" ++ u

            _ ->
                ""
