extends BaseAbilityResource
class_name InstantAbilityResource

@export var ally_targetting : bool

func use(target_chars : Array[CharacterResource]) -> void:
	print("Please don't use a base ability resource. Instead use a child ability resource for ability specific affect.")
