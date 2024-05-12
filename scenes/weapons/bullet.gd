class_name Bullet
extends Node2D

@export var speed: float = 750.0
var direction: Vector2 = Vector2.UP

func _physics_process(delta):
	position += direction * speed * delta


func _on_area_entered(area):
	print(area)
	if area.is_in_group("enemies"):
		print("hit!")
		area.hit()
		call_deferred("queue_free")
