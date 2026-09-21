extends EndTurnStatusResource
class_name Burn

func effect(holder : CharacterResource) -> void:
	holder.current_health -= stacks
	stacks = max(stacks - 2, 0)
