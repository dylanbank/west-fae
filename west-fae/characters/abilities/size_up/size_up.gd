extends InstantAbilityResource
class_name SizeUpAbility

func use(caster : Character, target_chars : Array[Character]) -> void:
	var status_stacks : int = target_chars.size()
	status_to_apply_to_self.stacks = status_stacks
	caster.statuses.append(status_to_apply_to_self)
