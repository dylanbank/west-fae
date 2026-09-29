extends Control

@export var status_res : StatusResource

@export var texture : TextureRect
@export var stack_nbr : Label
	
func _process(delta: float) -> void:
	if status_res:
		texture.texture = status_res.status_icon
		stack_nbr.text = str(status_res.stacks)
