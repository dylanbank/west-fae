extends Node3D

@export var group_area_size : Vector2
@export var character_tilt : float
@export var enemies : bool

var character_group : Array[WFCharacter]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var temp : Array[WFCharacter]
	character_group.assign(self.get_children())

	#var lowest_range : int = 5
	#var char_to_add : WFCharacter
	#var char_to_add_i : int = 999
	#while temp.size() > 0:
		#for i : int in temp.size():
			#if temp[i].range < lowest_range:
				#lowest_range = temp[i].range
	
	var character_count : float = character_group.size()
	
	if character_count > 0:
		#for character : WFCharacter in character_group:
			#character.rotate_y(deg_to_rad(character_tilt))
		if character_count > 1:	
			var x_increment : float = group_area_size.x/(character_count-1)
			var z_increment : float = group_area_size.y/(character_count-1)
			
			for i : int in character_group.size():
				character_group[i].position = Vector3((x_increment*i)-(group_area_size.x/2), 0, (z_increment*(character_count-i))-(group_area_size.y/2))

	
