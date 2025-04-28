extends Node

const MAIN = preload("res://Scene/Main/main.tscn")
const GAME = preload("res://Scene/Game/game.tscn")



func load_game_scene()-> void:
	get_tree().change_scene_to_packed(GAME)


func load_main_scene()-> void:
	get_tree().change_scene_to_packed(MAIN)
