extends Node3D

@onready var v_box_container: VBoxContainer = $CanvasLayer/VBoxContainer

## This is just to show off that everyone loaded into the new scene has a reference 
## to all of the players in the lobby
func _ready() -> void:
	for member in Networking.lobby_members:
		var label = Label.new()
		var steam_id: int = Networking.lobby_members[member]
		var steam_name: String = Steam.getFriendPersonaName(steam_id)
		label.text = steam_name
		v_box_container.add_child(label)
