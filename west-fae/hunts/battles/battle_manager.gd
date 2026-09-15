extends Node
class_name BattleManager

# character variables
@export var hunters : Array[CharacterResource]
@export var enemies : Array[CharacterResource]

var character_res : Array[CharacterResource]
var character_nodes : Array[Character]

# external functions
@export var initialize_characters : InitializeCharacters
@export var focus_camera : FocusCamera

# turn variables
var current_character_turn : int = -1
var enemies_start_e : int
var focused_char_res : CharacterResource = null
var focused_char_node : Character = null


func battle_start() -> void:
	incr_turn()

func clean_out_dead() -> void:
	character_res.remove_at(current_character_turn)
	character_nodes.remove_at(current_character_turn)
	
	current_character_turn -= 1

func incr_turn() -> void:
	if focused_char_node and focused_char_res:
		print(focused_char_node)
		print(focused_char_res)
		focused_char_node.focus_toggle()
		
		if focused_char_res.dead:
			clean_out_dead()
		
		focused_char_res = null
		focused_char_node = null
	
	#await get_tree().create_timer(1).timeout
	#
	## maybe put wait here so that the turn "notifiers" are smoothly changed
	
	current_character_turn += 1
	
	if current_character_turn > character_res.size()-1:
		current_character_turn = -1
		incr_turn()
	else:
		focused_char_res = character_res[current_character_turn]
		focused_char_node = character_nodes[current_character_turn]
		focused_char_node.focus_toggle()
		focus_camera.change_transform(focused_char_node.global_position, current_character_turn >= enemies_start_e)

func _ready() -> void:
	character_res.append_array(hunters)
	enemies_start_e = hunters.size() # element where enemies start in character arrays
	character_res.append_array(enemies)
	character_nodes.append_array(initialize_characters.initialize(hunters, true))
	character_nodes.append_array(initialize_characters.initialize(enemies, false))
