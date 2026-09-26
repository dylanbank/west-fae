extends InstantAbilityResource
class_name SizeUpAbility

func use(caster : Character, target_chars : Array[Character]) -> void:
	for target in target_chars:
		target.change_health(health_change)
	var status_stacks : int = target_chars.size()
	status_to_apply_to_self.stacks = status_stacks
	caster.add_status(status_to_apply_to_self)
	print(name, ". applying ", status_to_apply_to_self.name)
