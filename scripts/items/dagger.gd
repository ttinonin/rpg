extends Node2D

signal weapon_collected

var item_name = "dagger"
var description = "daniel menezes"
var damage = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		emit_signal("weapon_collected", self)
		queue_free()

func _on_weapon_collected() -> void:
	pass # Replace with function body.
