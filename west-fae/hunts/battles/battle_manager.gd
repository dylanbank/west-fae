extends Node
class_name BattleManager

@export var hunters : Array[HunterResource]
@export var enemies : Array[CharacterResource]
@export var initialize_characters : InitializeCharacters

var current_character_turn : int = 0
func _ready() -> void:
	initialize_characters.initialize(hunters, enemies)
