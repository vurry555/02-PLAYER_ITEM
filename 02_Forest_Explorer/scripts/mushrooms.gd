extends Node2D

@export var item_id: String = "mushrooms"


func _ready() -> void:
	# Если этот гриб уже собрали, а мы вернулись на сцену - убираем его
	if Global.picked.has(get_path()):
		queue_free()


# Если в Area2D находится любой body, вызывается данная функция
func _on_area_2d_body_entered(body: Node2D) -> void:
	# Проверка body == Player
	if body.name == "Player":
		Global.picked[get_path()] = true
		# Вызов сигнала с именем предмета
		Global.item_collected.emit(item_id)
		# Удаление предмета
		queue_free()
