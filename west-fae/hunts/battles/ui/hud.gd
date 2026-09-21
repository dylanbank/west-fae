extends Control
class_name BattleHUD

@export var battle_manager : BattleManager
@export var pre_battle_hud : MarginContainer
@export var hunter_battle_hud : MarginContainer
@export var post_battle_hud : Panel

func _on_start_battle_button_pressed() -> void:
	battle_manager.battle_start()
	
	hunter_battle_hud.show()
	pre_battle_hud.hide()

func _on_end_turn_button_pressed() -> void:
	battle_manager.incr_turn()

func _ready() -> void:
	pre_battle_hud.show()
	hunter_battle_hud.hide()
	post_battle_hud.hide()
	
func _process(_delta: float) -> void:
	if battle_manager.focused_char_node and battle_manager.focused_char_res:
		hunter_battle_hud.show()
	else:
		hunter_battle_hud.hide()
		
	if battle_manager.battle_finished:
		hunter_battle_hud.hide()
		post_battle_hud.show()
		if battle_manager.battle_won:
			post_battle_hud.set_battle_result(true)
			pass
		else:
			post_battle_hud.set_battle_result(false)
			pass
