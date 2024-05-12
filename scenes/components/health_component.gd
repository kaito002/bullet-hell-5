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
	body.modulate = get_color()
	tilt_timer.start()

func _on_tilt_timer_timeout() -> void:
	body.modulate = Color("ffffff")
	
func get_color() -> Color:
	var health_percentage: float = (float(lives)/max_lives) * 100
	#print("max lives: ", max_lives, " | lives: ", lives, " | percentage: ", health_percentage)
	
	if health_percentage > 70:
		return Color.GREEN_YELLOW
	elif health_percentage > 30:
		return Color.YELLOW
	else:
		return Color.RED
