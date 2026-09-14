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
var current_char_res : CharacterResource = null
var current_char_node : Character = null
var hunters_turn : bool = true

func battle_start() -> void:
	incr_turn()

func incr_turn() -> void:
	if current_char_node and current_char_res:
		print(current_char_node)
		print(current_char_res)
		current_char_node.focus_toggle()
		
		if current_char_res.dead:
			incr_turn()
		
		current_char_res = null
		current_char_node = null
	
	await get_tree().create_timer(1).timeout
	#
	## maybe put wait here so that the turn "notifiers" are smoothly changed
	
	current_character_turn += 1
	if (hunters_turn):
		if(current_character_turn > hunters.size()-1):
			current_character_turn = -1
			hunters_turn = false
			incr_turn()
		else:
			current_char_res = hunters[current_character_turn]
			current_char_node = hunter_nodes[current_character_turn]
			current_char_node.focus_toggle()
			focus_camera.change_transform(current_char_node.global_position, current_character_turn, false)
	else:
		if(current_character_turn > enemies.size()-1):
			current_character_turn = -1
			hunters_turn = true
			incr_turn()
			
		else:
			current_char_res = enemies[current_character_turn]
			current_char_node = enemy_nodes[current_character_turn]
			current_char_node.focus_toggle()
			focus_camera.change_transform(current_char_node.global_position, current_character_turn, true)

func _ready() -> void:
	hunter_nodes = initialize_characters.initialize(hunters, true)
	enemy_nodes = initialize_characters.initialize(enemies, false)
