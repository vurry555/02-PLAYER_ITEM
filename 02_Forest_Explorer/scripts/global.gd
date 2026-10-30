extends Node

# Сигнал передаёт имя предмета
signal item_collected(item_name: String)

# Имя игрока (задаётся на стартовой сцене)
var player_name: String = "Игрок"

# Сколько предметов собрано (хранится между сценами)
var counts: Dictionary = {}
# Какие грибы уже подобраны (чтобы не появлялись заново после смены сцены)
var picked: Dictionary = {}


func _ready() -> void:
	item_collected.connect(_on_item_collected)


func _on_item_collected(item_name: String) -> void:
	counts[item_name] = counts.get(item_name, 0) + 1


func _unhandled_input(event: InputEvent) -> void:
	# Esc - выход (игра запускается в полноэкранном режиме)
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
