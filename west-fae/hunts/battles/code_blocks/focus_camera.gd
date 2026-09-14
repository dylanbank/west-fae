extends Node
class_name FocusCamera

@export var camera : Camera3D
@export var init_position : Vector3
@export var position_offset : Vector3
@export var y_angle_scale : float
@export var lerp_weight : float

func change_transform(focus_char_pos : Vector3, char_order : int) -> void:
	print("change_transform")
	print(focus_char_pos)
	print(char_order)
	print(position_offset)
	
	if(focus_char_pos):
		var new_position : Vector3 = focus_char_pos + position_offset
		var new_y_rotation : float = (y_angle_scale * char_order) - (4.0 * y_angle_scale)
		camera.position = new_position
		camera.rotation_degrees.y = new_y_rotation
		#camera.position.move_toward(new_position, lerp_weight)
		#lerp(camera.rotation_degrees.y, new_y_rotation, lerp_weight)
	else:
		camera.position = init_position
		camera.rotation_degrees.y = 0
