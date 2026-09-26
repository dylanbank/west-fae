extends Control
class_name AbilityTargeting

@export var cursor_interact : CursorInteract
@export var update_abilities : UpdateAbilities
@export var battle_manager : BattleManager

@export var ally_targeting_color : Color
@export var enemy_targeting_color : Color

var active_targeting : bool = false
var targeting_ability : BaseAbilityResource

var targeted_pips : Array[int] = []
var caster : Character
var chars_to_target : Array[Character]


func try_use_ability() -> void:
	var targeted_chars : Array[Character]
	var clicked_char : Character 
	
	if !caster.character_res.enemy:
		clicked_char = cursor_interact.get_object_at_cursor().get("collider")
	else:
		var random_i : int = randi() % targeted_pips.size()
		clicked_char = chars_to_target[targeted_pips[random_i]]
	
	if clicked_char:
		if targeting_ability.hit_all:
			print("hit all")
			targeted_chars = chars_to_target
		else:
			targeted_chars = [clicked_char]
	
	if targeted_chars:
		targeting_ability.use(caster, targeted_chars)
	cancel_target()
	battle_manager.clean_out_dead()
			

func cancel_target() -> void:
	active_targeting = false

	for pip in targeted_pips:
		chars_to_target[pip].target(false, enemy_targeting_color)
	
	caster = null
	targeted_pips = []
	chars_to_target = []
	targeting_ability = null
	

func target(ability : BaseAbilityResource) -> void:
	cancel_target()
	
	caster = battle_manager.focused_char_node
	var caster_is_enemy : bool = caster.character_res.enemy
	targeting_ability = ability
		
	active_targeting = true
	targeted_pips = targeting_ability.affected_pips
	#if hunter or (!hunter and targeting_ability.ally_targetting):
		#chars_to_target = battle_manager.enemy_nodes
	#elif !hunter or (hunter and targeting_ability.ally_targetting):
		#chars_to_target = battle_manager.hunter_nodes
	if caster_is_enemy:
		chars_to_target = battle_manager.hunter_nodes
		if targeting_ability.ally_targetting:
			chars_to_target = battle_manager.enemy_nodes
	else:
		chars_to_target = battle_manager.enemy_nodes
		if targeting_ability.ally_targetting:
			chars_to_target = battle_manager.hunter_nodes
	
	if chars_to_target:	
		var target_color : Color = enemy_targeting_color
		if targeting_ability.ally_targetting:
			target_color = ally_targeting_color
		for pip in targeted_pips:
			chars_to_target[pip].target(true, target_color)
	
	if caster_is_enemy:
		await get_tree().create_timer(2).timeout
		try_use_ability()
	

func _on_ability_1_button_pressed() -> void:
	target(update_abilities.current_abilities[0])


func _on_ability_2_button_pressed() -> void:
	target(update_abilities.current_abilities[1])


func _on_ability_3_button_pressed() -> void:
	target(update_abilities.current_abilities[2])


func _on_ability_4_button_pressed() -> void:
	target(update_abilities.current_abilities[3])


func _on_weapon_button_pressed() -> void:
	target(update_abilities.current_weapon)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("rmb") and active_targeting and !battle_manager.focused_char_node.character_res.enemy:
		cancel_target()
	if event.is_action_released("lmb") and active_targeting and !battle_manager.focused_char_node.character_res.enemy:
		try_use_ability()
		battle_manager.check_if_battle_over() 
