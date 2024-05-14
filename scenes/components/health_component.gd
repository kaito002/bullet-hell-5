class_name HealthComponent
extends Node

signal health_percentage(percentage: float)

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
	health_percentage.emit(get_health_percentage())
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
	var health_perc: float = get_health_percentage()
	#print("max lives: ", max_lives, " | lives: ", lives, " | percentage: ", health_percentage)
	
	if health_perc > 70:
		return Color.GREEN_YELLOW
	elif health_perc > 30:
		return Color.YELLOW
	else:
		return Color.RED

func get_health_percentage():
	print((float(lives)/max_lives) * 100)
	return (float(lives)/max_lives) * 100
