class_name Bullet
extends Node2D

@export var speed: float = 750.0

func _physics_process(delta):
	position += Vector2.UP * speed * delta
