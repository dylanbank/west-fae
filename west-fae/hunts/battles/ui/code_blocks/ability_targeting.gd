extends Control
class_name AbilityTargeting

@export var update_abilities : UpdateAbilities
@export var battle_manager : BattleManager

func target(ability : BaseAbilityResource) -> void:
	var targeted_pips : Array[int] = ability.affected_pips
	# target the characters. pip system really needs to be fleshed out.
	

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
