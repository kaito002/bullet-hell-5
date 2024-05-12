extends Node

@export var lives: int = 50
@export var parent: Node

func hit():
	lives  = max(0, lives - 1)
	if lives == 0:
		parent.call_deferred("queue_free")
