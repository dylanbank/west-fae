extends BaseAbilityResource
class_name ProjectileAbilityResource	

@export var projectile : PackedScene
@export var rotate_with_vel : float
@export var rotate_random : bool
@export var lob_height : float

func use(caster : Character, target_chars : Array[Character]) -> void:
	print("Please don't use a base ability resource. Instead use a child ability resource for ability specific affect.")
