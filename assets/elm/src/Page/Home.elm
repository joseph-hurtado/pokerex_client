module Page.Home exposing (..)

import Data.Player as Player exposing (Player, usernameToString)
import Data.Session as Session exposing (Session)
import Html exposing (..)
import Html.Attributes exposing (class, style)
import Route as Route exposing (Route)


-- MODEL --


type alias Model =
    { greeting : String }


initialModel : Model
initialModel =
    { greeting = "Welcome to PokerEx" }



-- VIEW --


view : Session -> Model -> Html msg
view session model =
    let
        personalizedGreeting =
            case session.player of
                Just player ->
                    ", " ++ (usernameToString <| player.username)

                Nothing ->
                    "!"
    in
    main_ []
        [ div [ class "hero valign-wrapper" ]
            [ h1 [ class "welcome", style [ ( "text-align", "center" ) ] ]
                [ text (model.greeting ++ personalizedGreeting) ]
            , br [] []
            , viewButton session.player
            ]
        , div [ class "row landing" ]
            [ div [ class "col s12 m12 l4 landing-item" ]
                [ div [ class "card teal darken-2 landing-item" ]
                    [ div [ class "card-content white-text text-center" ]
                        [ span [ class "card-title center-align" ]
                            [ text "Create your own poker room and invite friends" ]
                        , p [ class "medium-text" ]
                            [ text """Sign up to create your own private poker rooms. Invite friends
                      or send invitations to other PokerEx players. Once you make a
                      private poker room, your game and table state will be kept alive
                      until you decide to close the room."""
                            ]
                        ]
                    ]
                ]
            , div [ class "col s12 m12 l4 landing-item" ]
                [ div [ class "card cyan darken-3 landing-item" ]
                    [ div [ class "card-content white-text text-center" ]
                        [ span [ class "card-title center-align" ]
                            [ text "What is PokerEx?" ]
                        , p [ class "pop-text" ]
                            [ text """PokerEx is an online poker environment
                      designed to deliver an engaging, real-time
                      experience."""
                            ]
                        ]
                    ]
                ]
            , div [ class "col s12 m12 l4 landing-item" ]
                [ div [ class "card indigo darken-4 landing-item" ]
                    [ div [ class "card-content white-text text-center" ]
                        [ span [ class "card-title center-align" ]
                            [ text "Join our public tables for a quick round" ]
                        , p [ class "medium-text" ]
                            [ text """Once you join us on PokerEx, you can sit down and play at
                      any one of our public rooms. Public rooms are a perfect fit
                      if you are looking to play a short round or two and get on
                      your way."""
                            ]
                        ]
                    ]
                ]
            ]
        ]


viewButton : Maybe Player -> Html msg
viewButton player =
    case player of
        Just player ->
            a [ class "waves-effect waves-light btn-large white-text margin-bottom-small", Route.href (Route.Profile (Player.usernameToString player.username)) ]
                [ i [ class "material-icons left large-text" ]
                    [ text "account_box" ]
                , text "Go to your account"
                ]

        _ ->
            a [ class "waves-effect waves-light btn-large white-text margin-bottom-small", Route.href Route.Register ]
                [ i [ class "material-icons left large-text" ]
                    [ text "add_circle" ]
                , text "Join PokerEx Now!"
                ]



-- UPDATE --


type Msg
    = DoNothing -- There is no reason yet for a Msg that does anything here.


type ExternalMsg
    = NoOp


update : Msg -> Model -> ( ( Model, Cmd Msg ), ExternalMsg )
update msg model =
    case msg of
        _ ->
            ( ( model, Cmd.none ), NoOp )
