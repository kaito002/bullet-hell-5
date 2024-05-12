extends Area2D
@onready var health_component = $health_component


func hit():
	health_component.hit()
