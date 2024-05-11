class_name PlayerMovement
extends CharacterBody2D

@onready var weapon: Weapon = $weapon

@export var speed: float = 300.0

var direction: Vector2 = Vector2.ZERO

func _physics_process(_delta):
	
	velocity = direction * speed
	move_and_slide()
	
func fire():
	weapon.fire()
