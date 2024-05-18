class_name Weapon
extends Node2D

@export var bullet_scene: PackedScene
@export var direction: Vector2 = Vector2.UP
@export var fire_rate: float = 3.0
@export var bullet_pattern: BulletPattern
@onready var debounce: Timer = $debounce



func _ready():
	direction = direction.normalized()
	debounce.wait_time = 1/fire_rate
	bullet_pattern.bullet = bullet_scene

func fire(target_direction: Vector2 = direction):
	if is_on_cooldown(): return
	debounce.start()
	
	bullet_pattern.shoot(target_direction)

func is_on_cooldown():
	return !debounce.is_stopped()

func build_bullet(target_direction):
	var bullet: Bullet = bullet_scene.instantiate()
	bullet.position = global_position
	bullet.direction = target_direction
	bullet.rotation = target_direction.angle()
	bullet.rotation_degrees += 90
	%Bullets.add_child.call_deferred(bullet, true)
	
