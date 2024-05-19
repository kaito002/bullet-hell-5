class_name PiscisMovements
extends Node

var movements: Array[MovementPattern] = []
@onready var health_component: HealthComponent = get_parent().get_node("health_component")

var current_movement: MovementPattern

func _ready():
	health_component.health_percentage.connect(on_health_change)
	for movement in get_children():
		movements.append(movement)

	current_movement = movements[0]
	current_movement.on_finished.connect(func(): start_movement(1))
	current_movement.move()

func start_movement(idx: int):
	current_movement.stop()
	current_movement = movements[idx]
	current_movement.move()

func on_health_change(percentage: float):
	if percentage <= 30 && current_movement != movements[3]:
		start_movement(3)
	elif percentage <= 60 && current_movement != movements[2]:
		start_movement(2)
