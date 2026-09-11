extends Resource
class_name CharacterResource

@export var name : String
@export var sprite : Texture2D
@export var character_node : PackedScene
@export var base_health : float

@export var strength : float
@export var dexterity : float
@export var constitution : float
@export var intelligence : float
@export var wisdom : float
#@export var charisma : float

@export var equipped_abilities : Array[BaseAbilityResource]
@export var equipped_weapon : WeaponResource
@export var equipped_items : Array[BaseItemResource]

func stats_after_calc() -> void:
	#var new_str : float = 0
	#var new_dex : float = 0
	#var new_con : float = 0
	#var new_int: float = 0
	#var new_wis : float = 0
	##var new_cha : float = 0
	#for item in items:
		#new_str += item.add_str
		#new_dex += item.add_dex
		#new_con += item.add_con 
		#new_int += item.add_int 
		#new_wis += item.add_wis 
		##new_cha += item.add_cha
	#for ability in abilities:
		#if "Strength" in ability.scaling_stat:
			#ability.current_str = ability.base_strength + new_str
		#if "Dexterity" in ability.scaling_stat:
			#
			#
			#
	pass
