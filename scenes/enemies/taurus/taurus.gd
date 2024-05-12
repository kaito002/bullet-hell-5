extends Area2D
@onready var health_component = $health_component



func _on_area_entered(_area):
	health_component.hit()
