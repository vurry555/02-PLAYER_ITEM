extends Node2D

# Границы камеры игрока для этой сцены (в пикселях мира)
@export var world_size: Vector2i = Vector2i(320, 192)


func _ready() -> void:
	var cam: Camera2D = $Player/Camera2D
	cam.limit_left = 0
	cam.limit_top = 0
	cam.limit_right = world_size.x
	cam.limit_bottom = world_size.y
