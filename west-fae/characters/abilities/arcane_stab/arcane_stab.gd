extends InstantAbilityResource
class_name ArcaneStabAbility

func use(_caster : Character, target_chars : Array[Character]) -> void:
	for character in target_chars:
		character.change_health(health_change)
		var new_status : StatusResource = status_to_apply_to_recipient.duplicate()
		new_status.stacks = abs(int(floorf(health_change)))
		character.add_status(new_status)
