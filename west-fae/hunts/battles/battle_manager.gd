extends Node
class_name BattleManager

# character variables
@export var hunters : Array[CharacterResource]
var hunter_nodes : Array[Character]
@export var enemies : Array[CharacterResource]
var enemy_nodes : Array[Character]

# external functions
@export var initialize_characters : InitializeCharacters
@export var focus_camera : FocusCamera

# turn variables
var current_character_turn : int = -1
var current_char : Dictionary = {
	'res' : CharacterResource,
	'node' : Character
}
var hunters_turn : bool = true

func battle_start() -> void:
	incr_turn("hunters")

func incr_turn(group : String) -> void:
	if current_char.node:
		current_char.node.focus_toggle()
		current_char.res = null
		current_char.node = null
	
	await get_tree().create_timer(1).timeout
	#
	## maybe put wait here so that the turn "notifiers" are smoothly changed
	
	current_character_turn += 1
	if (group == "hunters"):
		if(current_character_turn > hunters.size()-1):
			current_character_turn = -1
			incr_turn("enemies")
			hunters_turn = false
		else:
			current_char.res = hunters[current_character_turn]
			current_char.node = hunter_nodes[current_character_turn]
			current_char.node.focus_toggle()
			focus_camera.change_transform(current_char.node.global_position, current_character_turn)
	elif (group == "enemies"):
		if(current_character_turn > enemies.size()-1):
			current_character_turn = -1
			incr_turn("hunters")
			hunters_turn = true
		else:
			current_char.res = enemies[current_character_turn]
			current_char.node = enemy_nodes[current_character_turn]

	
func end_turn() -> void:
	if hunters_turn:
		incr_turn("hunters")
	else:
		incr_turn("enemies")

func _ready() -> void:
	hunter_nodes = initialize_characters.initialize(hunters, true)
	enemy_nodes = initialize_characters.initialize(enemies, false)
