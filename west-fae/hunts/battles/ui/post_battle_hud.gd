extends Panel

@export var post_battle_results : VBoxContainer
@export var result_label : Label

@export var win_text : String
@export var lose_text : String

func _ready() -> void:
	post_battle_results.hide()

func set_battle_result(win : bool) -> void:
	if win:
		post_battle_results.show()
		result_label.text = win_text
	else:
		result_label.text = lose_text
	


func _on_continue_pressed() -> void:
	get_tree().quit()
