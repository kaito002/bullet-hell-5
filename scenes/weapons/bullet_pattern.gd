class_name BulletPattern
extends Node2D

@export var are_bullets_linked = false
@onready var bullet_spawning_points = $"Bullet Spawning Points"
var bullet: PackedScene

var spawning_points: Array[Marker2D] = []

func _ready():
	for marker in bullet_spawning_points.get_children():
		spawning_points.append(marker)

func shoot(direction: Vector2):
	for marker in spawning_points:
		var new_bullet: Bullet = bullet.instantiate()
		new_bullet.global_position = marker.global_position
		new_bullet.direction = get_direction(direction, marker.position).normalized()
		new_bullet.rotation = direction.angle()
		new_bullet.rotation_degrees += 90
		%Bullets.add_child.call_deferred(new_bullet, true)

func get_direction(direction: Vector2, marker_position: Vector2):
	print(str("Direction: ", direction, " | marker position: ", marker_position.normalized()))
	print(str("Angle to marker: ", direction.angle_to(-marker_position)))
	if are_bullets_linked:
		return direction
	else:
		return direction * (direction.direction_to(marker_position))
	
