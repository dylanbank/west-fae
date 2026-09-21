extends DmgMitStatusResource
class_name Plated

func mitigate_damage(i_dmg : float) -> float:
	i_dmg -= stacks
	stacks -= 1
	return i_dmg
