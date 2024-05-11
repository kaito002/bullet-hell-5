class_name TaurusBullet
extends Area2D

@onready var sprite: Sprite2D = $NoseRing

var direction: Vector2 = Vector2.ZERO
var speed: float = 0

func _process(delta: float) -> void:
	sprite.rotate(2*PI * delta)
	position += speed * direction * delta
