extends Node3D
class_name BattleGroup

@export var group_area_size : Vector2 = Vector2(0,0)
@export var character_tilt : float
@export var enemies : bool
@export var standing_slots : int = 4

var character_group : Array[WFCharacter]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	character_group.assign(self.get_children())

	if character_group.size() > 0:
		for character : WFCharacter in character_group:
			character.rotate_y(deg_to_rad(character_tilt))
		if character_group.size()> 1:	
			var x_increment : float = group_area_size.x/(standing_slots-1)
			var z_increment : float = group_area_size.y/(standing_slots-1)
			for i : int in character_group.size():
				print(character_group[i])
				
				var x_direction : float = standing_slots-i-1
				var z_direction : float = i 
				if enemies:
					x_direction = i
					z_direction = standing_slots-i-1
					
				var x_offset : float = 0.0
				if(group_area_size.x != 0):
					x_offset = (x_increment*x_direction)-(group_area_size.x/2)
					
				var z_offset : float = 0.0
				if(group_area_size.y != 0):
					z_offset = (z_increment*z_direction)-(group_area_size.y/2)
				
				character_group[i].position = Vector3(x_offset, 0, z_offset)
				print(character_group[i].position)
	
