extends Node
class_name InitializeCharacters

@export var hunter_p_mats: Array[Node3D]
@export var enemy_p_mats : Array[Node3D]

func add_nodes_to_mats(c_res : Array, p_mats : Array) -> Array[Character]:
	var ret_nodes : Array[Character]
	for i in c_res.size():
		var char_res = c_res[i]
		var char_node : Character = char_res.character_node.instantiate()
		char_node.character_res = char_res
		char_node.find_child('Sprite3D').texture =  char_res.idle_sprite
		p_mats[i].add_child(char_node)
		ret_nodes.append(char_node)
	return ret_nodes

func initialize(char_res : Array, hunters : bool) -> Array[Character]:
	var mats : Array[Node3D]
	if hunters:
		mats = hunter_p_mats
	else:
		mats = enemy_p_mats
	if char_res and mats and char_res.size() <= mats.size():
		return add_nodes_to_mats(char_res, mats)
	else:
		return []
