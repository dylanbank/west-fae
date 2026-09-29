extends BaseAbilityResource
class_name InstantAbilityResource

func use(_caster : Character, _target_chars : Array[Character]) -> void:
	print("Please don't use a base ability resource. Instead use a child ability resource for ability specific affect.")
