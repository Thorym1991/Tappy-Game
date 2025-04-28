extends Control





func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Jump") and event.is_echo() == false:
		GameManager.load_game_scene()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	pass # Replace with function body.
