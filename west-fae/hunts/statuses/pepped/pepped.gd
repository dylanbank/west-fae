extends DmgAddStatusResource
class_name Pepped

func add_damage(o_dmg : float) -> float:
	o_dmg += stacks
	stacks = 0
	return o_dmg
