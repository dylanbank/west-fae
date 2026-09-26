extends Node
class_name InitializeHunt

@export var hunt_manager : HuntManager
@export var location : Node3D
@export var battle : Node3D

func _ready() -> void:
	var loc_inst : Node3D = hunt_manager.hunt_res.location.instantiate()
	location.add_child(loc_inst)
	battle.call_deferred("reparent", location)
