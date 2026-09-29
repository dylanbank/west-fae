extends InstantAbilityResource
class_name SizeUpAbility

func use(caster : Character, target_chars : Array[Character]) -> void:
	for target in target_chars:
		target.change_health(health_change)
	var status_stacks : int = target_chars.size()
	var new_status : StatusResource = status_to_apply_to_self.duplicate()
	new_status.stacks = status_stacks
	caster.add_status(new_status)
