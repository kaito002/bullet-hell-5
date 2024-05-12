class_name State
extends Node

@export var can_move: bool = true
var node: Node2D
var next_state: State

func state_process(_delta):
	pass

func state_input(_event: InputEvent):
	pass

func on_enter():
	pass

func on_exit():
	pass
