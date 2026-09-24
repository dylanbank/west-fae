extends Node
class_name AutoEnemiesTurn

func play_enemy_turn(battle_manager : BattleManager, enemy : Character) -> void:
	var enemy_abilities : Array = enemy.character_res.equipped_abilities
	
	var random_ability : int =  randi() % 5
	
	await get_tree().create_timer(2).timeout
	
	if enemy_abilities:
		var ability_to_use : BaseAbilityResource = enemy_abilities[random_ability]
		var targeted_hunters : Array[Character]
		for target_pos in ability_to_use.affected_pips:
			targeted_hunters.append(battle_manager.hunter_nodes[target_pos])
			
		enemy_abilities[random_ability].use(enemy, targeted_hunters)
	
	await get_tree().create_timer(2).timeout
	
	battle_manager.incr_turn()
	
