extends Control
class_name UpdateAbilities

@export var hud : BattleHUD
@export var battle_manager : BattleManager

@export var current_abilities : Array
@export var current_weapon : BaseAbilityResource

@export var ability_1_btn : Button
@export var ability_2_btn : Button
@export var ability_3_btn : Button
@export var ability_4_btn : Button
@export var weapon_btn : Button

@export var error_texture : Texture
@export var error_label : String

func _process(delta: float) -> void:
	if battle_manager.focused_char_node:
		var current_char : CharacterResource = battle_manager.focused_char_node.character_res
		if current_char.equipped_abilities:
			current_abilities = current_char.equipped_abilities
			if current_abilities[0]:
				var current_ability_1 : BaseAbilityResource = current_abilities[0]
				ability_1_btn.icon = current_ability_1.icon
				ability_1_btn.text = current_ability_1.name
			else:
				ability_1_btn.icon = error_texture
				ability_1_btn.text = error_label
				
			if current_abilities[1]:
				var current_ability_2 : BaseAbilityResource = current_abilities[1]
				ability_2_btn.icon = current_ability_2.icon
				ability_2_btn.text = current_ability_2.name
			else:
				ability_2_btn.icon = error_texture
				ability_2_btn.text = error_label
				
			if current_abilities[2]:
				var current_ability_3 : BaseAbilityResource = current_abilities[2]
				ability_3_btn.icon = current_ability_3.icon
				ability_3_btn.text = current_ability_3.name
			else:
				ability_3_btn.icon = error_texture
				ability_3_btn.text = error_label
				
			if current_abilities[3]:
				var current_ability_4 : BaseAbilityResource = current_abilities[3]
				ability_4_btn.icon = current_ability_4.icon
				ability_4_btn.text = current_ability_4.name
			else:
				ability_4_btn.icon = error_texture
				ability_4_btn.text = error_label
		else:
			ability_1_btn.icon = error_texture
			ability_1_btn.text = error_label
			
			ability_2_btn.icon = error_texture
			ability_2_btn.text = error_label
			
			ability_3_btn.icon = error_texture
			ability_3_btn.text = error_label
			
			ability_4_btn.icon = error_texture
			ability_4_btn.text = error_label
		if current_char.equipped_weapon:
			current_weapon = current_char.equipped_weapon
			weapon_btn.icon = current_weapon.icon
			weapon_btn.text = current_weapon.name
		else:
			weapon_btn.icon = error_texture
			weapon_btn.text = error_label
