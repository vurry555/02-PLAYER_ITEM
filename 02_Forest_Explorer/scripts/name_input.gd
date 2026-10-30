extends Control

const MIN_LENGTH := 3  # имя должно быть длиннее 2 символов
const FOREST_SCENE := "res://scenes/forest.tscn"

@onready var name_edit: LineEdit = $Center/VBox/NameEdit
@onready var error_label: Label = $Center/VBox/ErrorLabel


func _ready() -> void:
	name_edit.grab_focus()
	name_edit.text_submitted.connect(func(_t): _on_start_pressed())


func _on_start_pressed() -> void:
	var entered := name_edit.text.strip_edges()
	if entered.length() < MIN_LENGTH:
		error_label.text = "Имя должно быть длиннее 2 символов"
		return
	# После нажатия кнопки игроку присваивается это имя
	Global.player_name = entered
	get_tree().change_scene_to_file(FOREST_SCENE)
