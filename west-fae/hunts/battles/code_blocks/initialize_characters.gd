extends Node
class_name InitializeCharacters

@export var hunter_p_mats: Array[Node3D]
@export var enemy_p_mats : Array[Node3D]

func add_nodes_to_mats(c_res : Array, p_mats : Array) -> void:
	for i in c_res.size():
		var char_res = c_res[i]
		var char_node : Character = char_res.character_node.instantiate()
		char_node.character_res = char_res
		char_node.find_child('Sprite3D').texture =  char_res.idle_sprite
		p_mats[i].add_child(char_node)

func initialize(hunters_res : Array, enemies_res : Array) -> void:
	if hunters_res and hunter_p_mats and hunters_res.size() <= hunter_p_mats.size():
		add_nodes_to_mats(hunters_res, hunter_p_mats)
	if enemies_res and enemy_p_mats and enemies_res.size() <= enemy_p_mats.size():
		add_nodes_to_mats(enemies_res, enemy_p_mats)
