extends Node2D

@export var fire_rate: float = 1.0
var debounce: Timer
@onready var weapon = $weapon

func _ready():
	debounce = Timer.new()
	get_node(".").add_child(debounce, true)
	debounce.wait_time = fire_rate
	debounce.timeout.connect(_on_debounce_timeout)
	fire()

func fire():
	if is_on_cooldown(): return
	debounce.start()
	
	weapon.fire()

func is_on_cooldown():
	return !debounce.is_stopped()

func _on_debounce_timeout():
	debounce.stop()
	fire()

