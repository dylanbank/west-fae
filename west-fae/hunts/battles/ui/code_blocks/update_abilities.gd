extends Control
class_name UpdateAbilities

@export var hud : BattleHUD

@export var current_abilities : Array
@export var current_weapon : BaseAbilityResource

@export var ability_1_icon : TextureRect
@export var ability_1_name : Label

@export var ability_2_icon : TextureRect
@export var ability_2_name : Label

@export var ability_3_icon : TextureRect
@export var ability_3_name : Label

@export var ability_4_icon : TextureRect
@export var ability_4_name : Label

@export var weapon_icon : TextureRect
@export var weapon_name : Label

@export var error_texture : Texture
@export var error_label : String

func _process(delta: float) -> void:
	if hud.battle_manager.focused_char_res:
		var current_char : CharacterResource = hud.battle_manager.focused_char_res
		if current_char.equipped_abilities:
			current_abilities = current_char.equipped_abilities
			if current_abilities[0]:
				var current_ability_1 : BaseAbilityResource = current_abilities[0]
				ability_1_icon.texture = current_ability_1.icon
				ability_1_name.text = current_ability_1.name
			else:
				ability_1_icon.texture = error_texture
				ability_1_name.text = error_label
				
			if current_abilities[1]:
				var current_ability_2 : BaseAbilityResource = current_abilities[1]
				ability_2_icon.texture = current_ability_2.icon
				ability_2_name.text = current_ability_2.name
			else:
				ability_2_icon.texture = error_texture
				ability_2_name.text = error_label
				
			if current_abilities[2]:
				var current_ability_3 : BaseAbilityResource = current_abilities[2]
				ability_3_icon.texture = current_ability_3.icon
				ability_3_name.text = current_ability_3.name
			else:
				ability_3_icon.texture = error_texture
				ability_3_name.text = error_label
				
			if current_abilities[3]:
				var current_ability_4 : BaseAbilityResource = current_abilities[3]
				ability_4_icon.texture = current_ability_4.icon
				ability_4_name.text = current_ability_4.name
			else:
				ability_4_icon.texture = error_texture
				ability_4_name.text = error_label
		else:
			ability_1_icon.texture = error_texture
			ability_1_name.text = error_label
			
			ability_2_icon.texture = error_texture
			ability_2_name.text = error_label
			
			ability_3_icon.texture = error_texture
			ability_3_name.text = error_label
			
			ability_4_icon.texture = error_texture
			ability_4_name.text = error_label
		if current_char.equipped_weapon:
			current_weapon = current_char.equipped_weapon
			weapon_icon.texture = current_weapon.icon
			weapon_name.text = current_weapon.name
		else:
			weapon_icon.texture = error_texture
			weapon_name.text = error_label
