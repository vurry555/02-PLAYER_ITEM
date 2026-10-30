extends CharacterBody2D

var speed = 40
@export var anim: AnimatedSprite2D
@export var name_label: Label

# Флаг для sit
var is_sitting = false


func _ready() -> void:
	name_label.text = Global.player_name


# Функция фиксирует всё, что нажал игрок
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if is_sitting:
			is_sitting = false
			anim.play("idle")
		else:
			is_sitting = true
			anim.play("sit")


func _physics_process(_delta: float) -> void:
	# Если игрок сидит - движение отключено
	if is_sitting:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	var input = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	velocity = input.normalized() * speed
	move_and_slide()

	# Разворот спрайта в зависимости от направления персонажа
	if input.x > 0:
		anim.flip_h = false
	elif input.x < 0:
		anim.flip_h = true

	# Переключение состояний анимации
	if input != Vector2.ZERO:
		anim.play("walk")
	else:
		anim.play("idle")
