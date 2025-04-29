extends CharacterBody2D

class_name Tappy

#signal on_plane_died ausgelagerert in SignalHub


const JUMP_POWER: float = -350.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var engine_sound: AudioStreamPlayer = $EngineSound



var _gravity: float = ProjectSettings.get("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	fly(delta)
	move_and_slide()
	if is_on_floor() == true:
		die()
		


func fly(delta: float)-> void:
	velocity.y += _gravity * delta
	if Input.is_action_just_pressed("Jump") == true:
		velocity.y = JUMP_POWER
		animation_player.play("Jump")


func die() -> void:
	engine_sound.stop()
	animated_sprite_2d.stop()
	set_physics_process(false)
	SignalHub.emit_on_plane_died()
	
