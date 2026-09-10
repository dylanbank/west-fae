extends Resource
class_name AbilityResource

@export var name : String
@export var projectile : bool
@export var icon_texture : Texture2D
@export_enum("ClassStaple", "ClassOption", "AnyClass") var ability_slot : String
@export_enum("Gunslinger") var ability_class : String
@export var ally_targetting : bool
@export var effect_texture: Texture2D
@export var affected_pips : Array[int]

@export var status_to_apply : StatusResource
@export var flat_damage : float
@export var percent_damage : float
