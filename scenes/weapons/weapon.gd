class_name Weapon
extends Node2D

@export var bullet_scene: PackedScene
@onready var debounce: Timer = $debounce

func fire():
	if is_on_cooldown(): return
	debounce.start()
	
	var bullet: Bullet = bullet_scene.instantiate()
	bullet.global_position = global_position
	get_tree().root.add_child(bullet, true)

func is_on_cooldown():
	return !debounce.is_stopped()
