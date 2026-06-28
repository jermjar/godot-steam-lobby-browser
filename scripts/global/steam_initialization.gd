extends Node

const APP_ID: int = 480
const LOBBY_MEMBERS_MAX: int = 8

var steam_enabled: bool = false
var steam_id: int = 0
var steam_username: String
var is_online: bool = false
var is_game_owned: bool = false

## Set the App ID on startup, 480 is for developer testing
## NOTE - CHANGE THIS IF YOU ARE RELEASING YOUR GAME
func _init() -> void:
	OS.set_environment("SteamAppId", str(APP_ID))
	OS.set_environment("SteamGameId", str(APP_ID))

func _ready() -> void:
	_initialize_steam()

## Steam.run_callbacks() lets you communicate with Steam, keep in _process
func _process(_delta: float) -> void:
	if steam_enabled:
		Steam.run_callbacks()

## Closing the game if Steam isn't detected to be running, you can change this if you want obviously
## Showing off checks to see if the player is online, owns the game, grabbing their steam id, and username
func _initialize_steam() -> void:
	if !Engine.has_singleton("Steam"): get_tree().quit()
	
	var initialize_response: Dictionary = Steam.steamInitEx(APP_ID)
	print ("Did Steam initialize?: %s" % initialize_response)
	
	if initialize_response['status'] > Steam.STEAM_API_INIT_RESULT_OK:
		print("Failed to initialize Steam, disabling Steam functionality: %s" % initialize_response)
		steam_enabled = false
	else:
		steam_enabled = true
		is_online = Steam.loggedOn()
		is_game_owned = Steam.isSubscribed()
		steam_id = Steam.getSteamID()
		steam_username = Steam.getPersonaName()
		
		if !is_game_owned:
			print("User does not own this game")
