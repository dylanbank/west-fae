extends Node3D
class_name CursorInteract

const RAY_LENGTH = 10000.0

@export var cam : Camera3D

func get_object_at_cursor() -> Dictionary:
	var mouse_pos: Vector2 = get_viewport().get_mouse_position()
	
	# Raycast lengths
	var ray_length = 1000.0
	var from = cam.project_ray_origin(mouse_pos)
	var to = from + cam.project_ray_normal(mouse_pos) * ray_length
	
	# Access the 3D physics space
	var space_state = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(from, to)
	
	# Optional: If you only want to detect characters, configure collision layers/masks
	query.collision_mask = 2 
	
	var result = space_state.intersect_ray(query)
	
	#if(result):
		#print(result)
		
	return result
