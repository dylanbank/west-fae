extends Node3D
class_name Selection

@export var character : Character

@export var notifier : Sprite3D

@export var focus_pos_offset : Vector3
@export var focus_lerp : float

var init_pos : Vector3

func _ready() -> void:
	notifier.hide()
	init_pos = character.position

func _process(delta: float) -> void:
	# focus
	if character.focused:
		notifier.show()
		if !character.character_res.enemy:
			character.position = lerp(character.position, init_pos + focus_pos_offset, focus_lerp * delta)
	else:
		notifier.hide()
		character.position = lerp(character.position, init_pos, focus_lerp * delta)
	
	# targeting with ability
	if(character.targeted):
		character.sprite_3d.modulate = character.targeted_color
		
		# hovered while targeting with ability
		if(character.selected):
			character.sprite_3d.modulate = Color(1, 1, 1, 0.7)
	else:
		character.sprite_3d.modulate = Color(1, 1, 1, 1)


#func _on_character_mouse_entered() -> void:
	#character.selected = true
#
#
#func _on_character_mouse_exited() -> void:
	#character.selected = false
