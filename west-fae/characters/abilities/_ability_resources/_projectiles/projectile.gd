extends RigidBody3D

@export var ability : ProjectileAbilityResource

func _on_body_entered(body: Node) -> void:
	ability.effect(body)
	self.queue_free()
