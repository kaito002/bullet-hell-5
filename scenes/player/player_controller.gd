class_name PlayerController
extends Node

var player: CharacterBody2D

func _ready():
	player = get_parent()
	

func _process(delta):
	player.direction = Input.get_vector("left", "right", "up", "down")
	
	if (Input.is_action_pressed("fire")):
		player.fire()
