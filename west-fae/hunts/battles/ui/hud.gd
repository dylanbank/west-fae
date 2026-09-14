extends Control
class_name BattleHUD

@export var battle_manager : BattleManager
@export var pre_battle_hud : MarginContainer
@export var hunter_battle_hud : MarginContainer

func _on_start_battle_button_pressed() -> void:
	battle_manager.battle_start()
	
	hunter_battle_hud.show()
	pre_battle_hud.hide()

func _ready() -> void:
	pre_battle_hud.show()
	hunter_battle_hud.hide()
