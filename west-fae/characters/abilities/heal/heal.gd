extends InstantAbilityResource
class_name HealAbility

func use(_caster : Character, target_chars : Array[Character]) -> void:
	for target in target_chars:
		target.change_health(health_change)
