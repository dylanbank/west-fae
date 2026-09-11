extends BaseAbilityResource
class_name ProjectileResource	

@export var projectile : PackedScene
@export var velocity : float
@export var launch_angle : float

func use(target_chars : Array[CharacterResource]) -> void:
	print("Please don't use a base ability resource. Instead use a child ability resource for ability specific affect.")
