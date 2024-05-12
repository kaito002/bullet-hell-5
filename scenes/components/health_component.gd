class_name HealthComponent
extends Node

@export var parent: Node
@export var max_lives: int = 50
var lives: int

func _ready():
	parent = get_parent()
	lives = max_lives

func hit():
	lives  = max(0, lives - 1)
	if lives == 0:
		death()

func death():
	parent.call_deferred("queue_free")
