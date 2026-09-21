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

var battle_finished : bool = false
var battle_won : bool 

func battle_start() -> void:
	incr_turn()

func clean_out_dead() -> void:
	print("Before cleaning")
	print(current_character_turn)
	print(character_res)
	var dyn_char_arr_size : int = character_res.size()-1
	var i : int = 0
	
	# removing dead
	while(i<=dyn_char_arr_size):
		if character_res[i].dead:
			print("Character @ " + str(i) + " is dead. Being removed")
			dyn_char_arr_size -= 1
			character_res.remove_at(i)
			character_nodes.remove_at(i)
			if(i <= current_character_turn):
				current_character_turn -= 1
			i -= 1
		i += 1
		
	#checking if there is a winner	
	var all_hunters_dead : bool = true
	var all_enemies_dead : bool = true
	for j : int in character_res.size():
		if character_res[j].enemy:
			all_enemies_dead = false
		else:
			all_hunters_dead = false
	
	print("After cleaning")
	print(current_character_turn)
	print(character_res)
	print("Are hunters dead:")
	print(all_hunters_dead)
	print("Are enemies dead:")
	print(all_enemies_dead)
	
	# checking if the battle is over and who won
	# if botgh are dead, hunters still win
	if all_enemies_dead or all_hunters_dead:
		battle_finished = true
		if all_hunters_dead:
			battle_won = false
			# ENEMIES WIN
		elif all_enemies_dead:
			battle_won = true
			# HUNTERS WIN
		
		
	

func incr_turn() -> void:
	# loop through nodes to call end of turn status effect module on each character node
	
	clean_out_dead()
	
	if focused_char_node and focused_char_res:
			focused_char_node.focus_toggle()
			
			focused_char_res = null
			focused_char_node = null
	
	if !battle_finished:
		
		#await get_tree().create_timer(1).timeout
		
		current_character_turn += 1
		
		if current_character_turn > character_res.size()-1:
			current_character_turn = -1
			incr_turn()
		else:
			focused_char_res = character_res[current_character_turn]
			focused_char_node = character_nodes[current_character_turn]
			focused_char_node.focus_toggle()
			focus_camera.change_transform(focused_char_node.global_position, character_res[current_character_turn].enemy)

func _ready() -> void:
	for i : int in hunters.size():
		character_res.append(hunters[i])
	for i : int in enemies.size():
		character_res.append(enemies[i])
	
	character_nodes.append_array(initialize_characters.initialize(hunters, true))
	character_nodes.append_array(initialize_characters.initialize(enemies, false))
	print("chararacter resources loaded: ", str(character_res))
	print("chararacter nodes loaded: ", str(character_nodes))
