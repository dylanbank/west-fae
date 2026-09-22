extends BaseAbilityResource
class_name InstantAbilityResource

@export var ally_targetting : bool

func use(caster : Character, target_chars : Array[Character]) -> void:
	print("Please don't use a base ability resource. Instead use a child ability resource for ability specific affect.")
