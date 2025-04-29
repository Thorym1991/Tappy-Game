extends Control

const GAME_OVER = preload("res://assets/audio/game_over.wav")

@onready var game_over_label: Label = $"Game over Label"
@onready var press_exit_label: Label = $"Press Exit Label"
@onready var timer: Timer = $Timer
@onready var score_label: Label = $"MarginContainer/Score Label"
@onready var sound: AudioStreamPlayer = $Sound


var _score: int = 0

func _ready() -> void:
	_score = 0
	get_tree().paused = false
	pass # Replace with function body.


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit"):
		GameManager.load_main_scene()
	elif press_exit_label.visible == true and event.is_action_pressed("Jump"):
		ScoreManager.high_score = _score
		GameManager.load_main_scene()



func _enter_tree() -> void:
	SignalHub.on_point_scored.connect(_on_point_scored)
	SignalHub.on_plane_died.connect(on_plane_died)
	

func _on_point_scored() -> void:
	sound.play()
	_score +=1
	score_label.text = "%04d" % _score


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func on_plane_died() -> void:
	sound.stop()
	sound.stream = GAME_OVER
	sound.play()
	game_over_label.show()
	timer.start()

func _on_timer_timeout() -> void:
	game_over_label.hide()
	press_exit_label.show()
