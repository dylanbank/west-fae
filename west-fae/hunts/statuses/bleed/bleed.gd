extends EndTurnStatusResource
class_name Bleed

func effect(holder : CharacterResource) -> void:
	holder.current_health -= stacks
	stacks += 1
