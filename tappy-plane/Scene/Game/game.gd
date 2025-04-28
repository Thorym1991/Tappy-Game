extends Node2D


const PIPES = preload("res://Scene/pipe/pipes.tscn")

@onready var game_over_ui: Control = $GameOverUI
@onready var lower_point: Marker2D = $LowerPoint
@onready var upper_point: Marker2D = $UpperPoint
@onready var pipes_holder: Node = $PipesHolder



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_spwan_pipes()
	

func _enter_tree() -> void:
	SignalHub._on_plane_died.connect(_on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _spwan_pipes() -> void:
	var np = PIPES.instantiate()
	var y_pos:  float = randf_range(
		upper_point.position.y,
		lower_point.position.y,
	)
	np.position = Vector2(
		upper_point.position.x,
		y_pos
	)
	pipes_holder.add_child(np)



func _on_spawn_timer_timeout() -> void:
	_spwan_pipes()
	pass # Replace with function body.


func _on_plane_died() -> void:
	get_tree().paused = true
