extends Node3D
class_name FocusCamera

@export var camera : Camera3D
@export var init_position : Vector3
@export var position_offset : Vector3
@export var init_y_angle : float
@export var y_angle : float
@export var lerp_weight : float


var new_cam_pos : Vector3
var new_cam_rot : float

func change_transform(focus_char_pos : Vector3, char_order : int, return_to_init_pos : bool) -> void:
	
	if(!return_to_init_pos):
		new_cam_pos = focus_char_pos + position_offset
		new_cam_rot = y_angle
	else:
		new_cam_pos = init_position
		new_cam_rot = init_y_angle

func _process(delta: float) -> void:
	camera.position = lerp(camera.position, new_cam_pos, lerp_weight * delta)
	camera.rotation_degrees.y = lerp(camera.rotation_degrees.y, new_cam_rot, lerp_weight * delta)
	
func _ready() -> void:
	new_cam_pos = init_position
	new_cam_rot = init_y_angle
