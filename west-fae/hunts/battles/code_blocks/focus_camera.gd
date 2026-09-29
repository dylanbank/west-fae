extends Node3D
class_name FocusCamera

@export var camera : Camera3D
@export var init_position : Vector3
@export var position_offset : Vector3
@export var init_rot : Vector2
@export var focus_rot : Vector2
@export var lerp_weight : float

@export var cam_grab_offset_ce : float = 0.001

var grab_camera : bool = false

var new_cam_pos : Vector3
var new_cam_rot : Vector2

func change_transform(focus_char_pos : Vector3, return_to_init_pos : bool) -> void:
	print(focus_char_pos)
	if(!return_to_init_pos):
		new_cam_pos = focus_char_pos + position_offset
		new_cam_rot = focus_rot
	else:
		new_cam_pos = init_position
		new_cam_rot = init_rot

func _process(delta: float) -> void:
	camera.position = lerp(camera.position, new_cam_pos, lerp_weight * delta)
	if grab_camera:
		var mouse_offset : Vector2 = (get_viewport().get_mouse_position() - Vector2(get_viewport().size / 2))
		camera.rotation_degrees.x = -(new_cam_rot.y + mouse_offset.y * cam_grab_offset_ce)
		camera.rotation_degrees.y =  -(new_cam_rot.y + mouse_offset.x * cam_grab_offset_ce)
	else:
		camera.rotation_degrees.x = lerp(camera.rotation_degrees.x, new_cam_rot.x, lerp_weight * delta)
		camera.rotation_degrees.y = lerp(camera.rotation_degrees.y, new_cam_rot.y, lerp_weight * delta)
	
func _ready() -> void:
	
	new_cam_pos = init_position
	new_cam_rot = init_rot
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("mmb"):
		grab_camera = true
		#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		
	if event.is_action_released("mmb"):
		grab_camera = false
		#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
