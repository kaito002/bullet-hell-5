class_name Player
extends CharacterBody2D

@onready var weapon: Weapon = $weapon
@export var speed: float = 300.0

var direction: Vector2 = Vector2.ZERO

func _ready():
	Globals.lives = 5
	Globals.player = get_node(".")

func _physics_process(_delta):
	velocity = direction * speed
	move_and_slide()
	
func fire():
	var mouse_direction = global_position.direction_to(get_global_mouse_position())
	weapon.fire(mouse_direction)

func hit():
	Globals.lives -= 1
	if Globals.lives <= 0:
		call_deferred("game_over")

func game_over():
	get_tree().reload_current_scene()
