extends Node3D
class_name StatusIcons

@export var status_icon_container : HBoxContainer
@export var status_node : PackedScene

func add_status_icon(status_to_add : StatusResource) -> void:
	var status_node_inst : Control = status_node.instantiate()
	status_icon_container.add_child(status_node_inst)
	status_node_inst.status_res = status_to_add

func remove_status_icon (status_to_rem : StatusResource) -> void:
	if status_icon_container.get_children():
		for icon_con : Control in status_icon_container.get_children():
			print(icon_con)
			if icon_con.status_res.get_script().get_global_name() == status_to_rem.get_script().get_global_name():
				icon_con.queue_free() # removes
			
