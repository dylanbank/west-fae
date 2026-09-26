extends Node
class_name InitializeCharacters

#@export var hunter_p_mats: Array[Node3D]
#@export var enemy_p_mats : Array[Node3D]

@export var hunter_grouping: Node3D
@export var enemy_grouping : Node3D

@export var hunter_pos : Array[Vector3]
@export var enemy_pos : Array[Vector3]

@export var character_rotation : float
func add_nodes_to_pos(c_res : Array[CharacterResource], c_pos : Array[Vector3], c_grp : Node3D, hunters : bool) -> Array[Character]:
	var ret_nodes : Array[Character]
	for i in c_res.size():
		var char_res = c_res[i]
		var char_node : Character = char_res.character_node.instantiate()
		char_node.character_res = char_res
		char_node.find_child('CharacterSprite').texture =  char_res.idle_sprite
		c_grp.add_child(char_node)
		char_node.position = c_pos[i]
		char_node.rotation_degrees.x = -4
		
		var char_rot : float = character_rotation
		if !hunters:
			char_rot *= -1
		
		char_node.rotation_degrees.y = char_rot
		ret_nodes.append(char_node)
	return ret_nodes

func initialize(char_res : Array, hunters : bool) -> Array[Character]:
	var char_positions : Array[Vector3]
	var char_grouping : Node3D
	if hunters:
		char_positions = hunter_pos
		char_grouping = hunter_grouping
	else:
		char_positions = enemy_pos
		char_grouping = enemy_grouping
	if char_res and char_positions and char_res.size() <= char_positions.size():
		return add_nodes_to_pos(char_res, char_positions, char_grouping, hunters)
	else:
		return []
