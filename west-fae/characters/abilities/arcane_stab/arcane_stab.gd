extends InstantAbilityResource
class_name ArcaneStabAbility

func use(caster : Character, target_chars : Array[Character]) -> void:
	for character in target_chars:
		character.change_health(health_change)
		status_to_apply_to_recipient.stacks = health_change
		character.add_status(status_to_apply_to_recipient)
