class_name BulletPattern
extends Node2D

@export var are_bullets_linked = true
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
		new_bullet.rotation = new_bullet.direction.angle()
		new_bullet.rotation_degrees += 90
		%Bullets.add_child.call_deferred(new_bullet, true)

func get_direction(direction: Vector2, marker_position: Vector2):
	if are_bullets_linked:
		return direction
	else:
		var rotation_rads = Vector2.ZERO.angle_to_point(-marker_position.normalized()) - deg_to_rad(90)
		return direction.rotated(rotation_rads).normalized()
	
