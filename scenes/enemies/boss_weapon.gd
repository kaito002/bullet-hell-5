class_name BossWeapon
extends Node2D

@onready var fire_rate: Timer = $fire_rate
var fire_pattern: FirePattern

func start_shooting():
	fire_rate.start()
	
func stop_shooting():
	fire_rate.stop()

func _ready() -> void:
	load_fire_pattern()
	fire_rate.connect("timeout", on_timeout)
	
func on_timeout():
	if fire_pattern != null:
		fire_pattern.fire()
	
func load_fire_pattern():
	for node in get_children():
		if node is FirePattern:
			fire_pattern = node
			break
