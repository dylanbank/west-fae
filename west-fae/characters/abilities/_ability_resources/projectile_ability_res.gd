extends BaseAbilityResource
class_name ProjectileAbilityResource	

@export var projectile : PackedScene
@export var rotate_with_vel : bool
@export var rotate_random : bool
@export var lob_height : float

func use(caster : Character, target_chars : Array[Character]) -> void:
	var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
	var vel_y : float = sqrt(2 * gravity * lob_height)
	var tot_time : float = 2 * vel_y / gravity
	var caster_pos : Vector3 = caster.global_position
	
	for target in target_chars:
		var proj_inst : RigidBody3D = projectile.instantiate()
		caster.add_child(proj_inst)
		proj_inst.global_position = caster_pos
		proj_inst.ability = self
		
		var pos_diff : Vector3 = target.global_position - caster_pos
		var vel_xz : Vector3 = pos_diff / tot_time
		
		proj_inst.linear_velocity = Vector3(vel_xz.x, vel_y, vel_xz.z)
		
		

func effect(target : Character) -> void:
	print("Please don't use a base ability resource. Instead use a child ability resource for ability specific affect.")
