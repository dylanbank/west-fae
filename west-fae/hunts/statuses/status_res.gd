extends Resource
class_name StatusResource

@export var name : String
@export var status_icon : Texture2D
@export var stacks : int

func effect(holder : CharacterResource) -> void:
	print("Please create child class extending from status resource")
