extends CharacterBody2D

const SPEED = 40
var chase = false
var player = null

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if chase:
		position += ((player.position - position)/SPEED)
		
		animated_sprite.play("jump")
		
		if (player.position.x - position.x) < 0:
			animated_sprite.flip_h = true
		else:
			animated_sprite.flip_h = false
	else:
		animated_sprite.play("idle")

func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	chase = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null
	chase = false
