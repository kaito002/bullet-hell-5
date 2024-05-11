class_name Weapon
extends Node2D

@export var bullet_scene: PackedScene
@onready var debounce: Timer = $debounce

var direction: Vector2 = Vector2.UP

func fire(target_direction: Vector2):
	if is_on_cooldown(): return
	debounce.start()
	
	var bullet: Bullet = bullet_scene.instantiate()
	bullet.global_position = global_position
	bullet.direction = target_direction
	bullet.rotation = target_direction.angle()
	bullet.rotation_degrees += 90
	get_tree().root.add_child.call_deferred(bullet, true)

func is_on_cooldown():
	return !debounce.is_stopped()
