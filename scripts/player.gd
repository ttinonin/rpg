extends CharacterBody2D

const SPEED = 300.0
var health = 100.0
var direction = Vector2.ZERO
var animation_status = ""

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func attack():
	print("attack")

func move():
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		animation_status = "up"
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		animation_status = "down"
		direction.y += 1
	if Input.is_action_pressed("move_left"):
		animation_status = "horizontal"
		animated_sprite.flip_h = true
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		animation_status = "horizontal"
		animated_sprite.flip_h = false
		direction.x += 1
		
	direction = direction.normalized()
	
	velocity = direction * SPEED

	move_and_slide()

func animate():
	if direction == Vector2.ZERO:
		animated_sprite.play(animation_status + "_idle")
	else:
		animated_sprite.play(animation_status)

func _physics_process(delta: float) -> void:
	move()
	animate()
	attack()
