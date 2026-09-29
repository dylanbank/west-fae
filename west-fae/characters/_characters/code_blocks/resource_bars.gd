extends Node3D
class_name ResourceBars

@export var character : Character
@export var resource_bars : ResourceProgressBars
#@export var energy_bar : ProgressBar

func _ready() -> void:
	resource_bars.health_progress_bar.max_value = character.character_res.max_health

func _process(_delta: float) -> void:
	resource_bars.health_progress_bar.value = character.character_res.current_health
	#health_bar.value = 20.0
	
