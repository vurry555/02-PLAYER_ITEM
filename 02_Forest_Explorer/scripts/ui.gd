extends CanvasLayer

@export var label: Label

var item_count: int = 0


# Как интерфейс появился, он сразу подписывается на обновление сигнала item_collected
func _ready() -> void:
	item_count = Global.counts.get("mushrooms", 0)
	label.text = str(item_count)
	Global.item_collected.connect(_on_item_collected)


# Функция, что вызывается при обновлении сигнала item_collected
func _on_item_collected(item_name: String) -> void:
	if item_name == "mushrooms":
		item_count += 1
		label.text = str(item_count)
