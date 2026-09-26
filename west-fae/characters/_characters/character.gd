extends CharacterBody3D
class_name Character

@export var character_res = CharacterResource
@export var hit_time_scale : float = 2.0
@export var hit_distance_scale : float = 2.0

@onready var timer: Timer = $Timer
@onready var sprite_3d: Sprite3D = $CharacterSprite

var focused : bool = false
var targeted : bool = false
var targeted_color : Color = Color(1, 0, 0, 1)

var selected : bool = false
var selected_exclusive : bool = false

func target(target_state : bool, t_color : Color):
	targeted = target_state
	if targeted:
		targeted_color = t_color
	else:
		targeted_color = Color(1, 1, 1, 1)

func focus_toggle() -> void:
	await get_tree().create_timer(0.25).timeout
	focused = !focused
	#if focused:
		#print("focus")
	#else:
		#print("unfocus")
		
func calc_hit_time(dmg_amt : float) -> float:
	var perc_of_health : float = dmg_amt / character_res.current_health
	return min(perc_of_health * hit_time_scale, 3.0)

func change_health(raw_dmg_amt : float) -> void:
	
	if raw_dmg_amt < 0 and !character_res.dead:
		var hit_anim_duration : float = calc_hit_time(abs(raw_dmg_amt))
		sprite_3d.texture = character_res.hit_sprite
		timer.wait_time = hit_anim_duration
		timer.start()
	
	character_res.current_health = max(character_res.current_health + raw_dmg_amt, 0)
	if character_res.current_health == 0:
		character_res.dead = true
	
func add_status(status_to_add : StatusResource) -> void:
	var add_existing_stacks : bool = true
	for current_status in character_res.statuses:
		if current_status.name == status_to_add.name:
			current_status.stacks += status_to_add.stacks
			add_existing_stacks = false
	if add_existing_stacks:
		character_res.statuses.append(status_to_add)

func _on_timer_timeout() -> void:
	if character_res.dead:
		sprite_3d.texture = null #character_res.dead_sprite
	else:
		sprite_3d.texture = character_res.idle_sprite

func _ready() -> void:
	sprite_3d.texture = character_res.idle_sprite
