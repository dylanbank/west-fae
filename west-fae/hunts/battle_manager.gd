extends Node
class_name BattleManager

@export var hunters : Array[HunterResource]
@export var enemies : Array[CharacterResource]

@export var hunter_p_mats: Array[Node3D]
@export var enemy_p_mats : Array[Node3D]

func add_nodes_to_mats(c_res : Array, p_mats : Array) -> void:
	for i in c_res.size():
		var char_res = c_res[i]
		var char_node : Character = char_res.character_node.instantiate()
		char_node.character_res = char_res
		char_node.find_child('Sprite3D').texture =  char_res.idle_sprite
		p_mats[i].add_child(char_node)

func _ready() -> void:
	if hunters and hunter_p_mats and hunters.size() <= hunter_p_mats.size():
		add_nodes_to_mats(hunters, hunter_p_mats)
	if enemies and enemy_p_mats and enemies.size() <= enemy_p_mats.size():
		add_nodes_to_mats(enemies, enemy_p_mats)
