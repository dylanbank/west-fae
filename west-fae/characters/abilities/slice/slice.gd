extends InstantAbilityResource
class_name SliceAbility

func use(caster : Character, target_chars : Array[Character]) -> void:
	for character in target_chars:
		character.take_damage(health_change)
