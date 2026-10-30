extends Area2D

# Сцена, на которую переходит игрок, когда ступает в область
@export_file("*.tscn") var target_scene: String = ""


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and target_scene != "":
		get_tree().call_deferred("change_scene_to_file", target_scene)
