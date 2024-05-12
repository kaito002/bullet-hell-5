class_name HealthComponent
extends Node

@onready var tilt_timer: Timer = $tilt_timer

@export var parent: Node
@export var max_lives: int = 50
var lives: int
var body: Node2D 

func _ready():
	parent = get_parent()
	body = parent.get_node("Art")
	lives = max_lives

func hit():
	lives  = max(0, lives - 1)
	_on_hit()
	if lives == 0:
		death()

func death():
	parent.call_deferred("queue_free")
	
func _on_hit():
	body.modulate = Color("b90a00")
	tilt_timer.start()


func _on_tilt_timer_timeout() -> void:
	body.modulate = Color("ffffff")
