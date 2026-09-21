extends Resource
class_name CharacterResource

@export var name : String
@export var enemy : bool = false
@export var idle_sprite : Texture2D
@export var hit_sprite : Texture2D
@export var dead_sprite : Texture2D
@export var character_node : PackedScene
@export var base_health : float
@export var current_health : float

@export var strength : float
@export var dexterity : float
@export var grit : float
@export var intelligence : float
@export var instinct : float
#@export var charisma : float

@export var equipped_abilities : Array[BaseAbilityResource]
@export var equipped_weapon : WeaponResource
@export var equipped_items : Array[BaseItemResource]

@export var dead : bool = false
