extends Node

signal _on_plane_died


func emit_on_plane_died() -> void:
	_on_plane_died.emit()
