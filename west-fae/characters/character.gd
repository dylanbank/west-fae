extends CharacterBody3D
class_name Character

@export var character_res = CharacterResource
@export var hit_time_scale : float = 2.0
@export var hit_distance_scale : float = 2.0
@export var focus_pos_offset : Vector3
@export var focus_lerp : float

@onready var timer: Timer = $Timer
@onready var sprite_3d: Sprite3D = $Sprite3D

var focused : bool = false

func focus_toggle() -> void:
	await get_tree().create_timer(0.25).timeout
	focused = !focused
	if focused:
		print("focus")
	else:
		print("unfocus")
		
func calc_hit_time(dmg_amt : float) -> float:
	var perc_of_health : float = dmg_amt / character_res.current_health
	return perc_of_health * hit_time_scale

func take_damage(raw_dmg_amt : float) -> void:
	var hit_anim_duration : float = calc_hit_time(raw_dmg_amt)
	sprite_3d.texture = character_res.hit_sprite
	timer.wait_time = hit_anim_duration
	timer.start()
	
	character_res.current_health = max(character_res.current_health - raw_dmg_amt, 0)
	if character_res.current_health == 0:
		character_res.dead = true
	

func _on_timer_timeout() -> void:
	if character_res.dead:
		sprite_3d.texture = character_res.dead_sprite
	else:
		sprite_3d.texture = character_res.idle_sprite

func _ready() -> void:
	sprite_3d.texture = character_res.idle_sprite

func _process(delta: float) -> void:
	if(focused):
		self.position = lerp(self.position, focus_pos_offset, focus_lerp * delta)
	else:
		self.position = lerp(self.position, Vector3(0,0,0), focus_lerp * delta)
