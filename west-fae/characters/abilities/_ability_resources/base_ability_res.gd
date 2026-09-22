extends Resource
class_name BaseAbilityResource

@export var name : String
@export var descr : String
@export var icon : Texture2D
@export_enum("ClassStaple", "ClassOption", "AnyClass") var ability_slot : String
@export_enum("Gunslinger") var ability_class : String
@export var scaling_stat : Array[String]
@export var effect_texture: Texture2D
@export var affected_pips : Array[int]
@export var flexible_targetting : bool
@export var cast_nbr : int

@export var health_change : float #damage or heal amount

@export var status_to_apply_to_self : StatusResource
@export var status_to_apply_to_recipient : StatusResource

# stat changes
#@export var flat_damage : float
#@export var percent_damage : float
#@export var new_interaction : float

func use(caster : Character, target_chars : Array[Character]) -> void:
	print("Please don't use a base ability resource. Instead use a child ability resource for ability specific affect.")
