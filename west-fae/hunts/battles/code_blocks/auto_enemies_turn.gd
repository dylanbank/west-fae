extends Node
class_name AutoEnemiesTurn

@export var ability_targeting : AbilityTargeting

func play_enemy_turn(battle_manager : BattleManager) -> void:
	var caster : Character = battle_manager.focused_char_node
	var enemy_abilities : Array = caster.character_res.equipped_abilities
	
	var random_ability : int =  randi() % 4
	
	
	await get_tree().create_timer(2).timeout
	
	if enemy_abilities:
		var ability_to_use : BaseAbilityResource = enemy_abilities[random_ability]
		var targeted_hunters : Array[Character]
		
		ability_targeting.target(ability_to_use) # start targeting
		
	
	await get_tree().create_timer(2).timeout
	
	
	battle_manager.incr_turn()
	
