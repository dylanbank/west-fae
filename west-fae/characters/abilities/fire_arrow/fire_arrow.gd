extends ProjectileAbilityResource
class_name FireArrowAbility

func use(caster : Character, target_chars : Array[Character]) -> void:
	var proj_inst : RigidBody3D = projectile.instantiate()
	proj_inst.global_position = caster.global_position
	pass
