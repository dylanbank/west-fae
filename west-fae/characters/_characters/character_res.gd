extends Resource
class_name CharacterResource

@export var name : String
@export var enemy : bool = false
@export var idle_sprite : Texture2D
@export var hit_sprite : Texture2D
@export var dead_sprite : Texture2D
@export var character_node : PackedScene
@export var base_health : float
@export var max_health : float
@export var current_health : float

@export var strength : float
@export var dexterity : float
@export var grit : float
@export var intelligence : float
@export var instinct : float
#@export var charisma : float

@export var statuses : Array[StatusResource]

@export_custom(PROPERTY_HINT_RESOURCE_TYPE, "BaseAbilityResource") var equipped_abilities : Array
@export var equipped_weapon : BaseAbilityResource
@export var equipped_items : Array[BaseItemResource]

@export var dead : bool = false
