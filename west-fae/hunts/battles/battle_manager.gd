extends Node
class_name BattleManager

# character variables
@export var hunters : Array[CharacterResource]
@export var enemies : Array[CharacterResource]
@export var hunter_nodes : Array[Character]
@export var enemy_nodes : Array[Character]

var character_turn_order : Array[Character]

# external functions
@export var initialize_characters : InitializeCharacters
@export var focus_camera : FocusCamera
@export var auto_enemies_turn : AutoEnemiesTurn

# turn variables
var current_character_turn : int = -1
var focused_char_node : Character = null

var battle_finished : bool = false
var battle_won : bool 

func battle_start() -> void:
	incr_turn()

func clean_out_dead() -> void:
	print("Before cleaning")
	print(current_character_turn)

	var dyn_char_arr_size : int = character_turn_order.size()-1
	var i : int = 0
	
	# removing dead
	while(i<=dyn_char_arr_size):
		if character_turn_order[i].character_res.dead:
			print("Character @ " + str(i) + " is dead. Being removed")
			dyn_char_arr_size -= 1
			character_turn_order.remove_at(i)
			if(i <= current_character_turn):
				current_character_turn -= 1
			i -= 1
		i += 1
		
	#checking if there is a winner	
	var all_hunters_dead : bool = true
	var all_enemies_dead : bool = true
	for j : int in character_turn_order.size():
		if character_turn_order[j].character_res.enemy:
			all_enemies_dead = false
		else:
			all_hunters_dead = false
	
	print("After cleaning")
	print(current_character_turn)

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
	
	if focused_char_node:
			focused_char_node.focus_toggle()
			
			focused_char_node = null
	
	if !battle_finished:
		
		#await get_tree().create_timer(1).timeout
		
		current_character_turn += 1
		
		if current_character_turn > character_turn_order.size()-1:
			current_character_turn = -1
			incr_turn()
		else:
			
			focused_char_node = character_turn_order[current_character_turn]
			focused_char_node.focus_toggle()
			focus_camera.change_transform(focused_char_node.global_position, character_turn_order[current_character_turn].character_res.enemy)
		if(focused_char_node.character_res.enemy):
			auto_enemies_turn.play_enemy_turn(self, focused_char_node)

# sorting by character dex desc
func set_turn_order() -> void:
	var temp : Array[Character]
	temp.append_array(hunter_nodes)
	temp.append_array(enemy_nodes)
	
	var max_dex_char_i : int
	while temp.size():
		var max_dex : int = -1
		for i : int in temp.size():
			if temp[i].character_res.dexterity > max_dex:
				max_dex = temp[i].character_res.dexterity
				max_dex_char_i = i
		var max_dex_char : Character = temp.pop_at(max_dex_char_i)
		character_turn_order.append(max_dex_char)
	
	print("turn order set: ", character_turn_order)

func _ready() -> void:
	hunter_nodes = initialize_characters.initialize(hunters, true)
	enemy_nodes = initialize_characters.initialize(enemies, false)
	
	set_turn_order()
