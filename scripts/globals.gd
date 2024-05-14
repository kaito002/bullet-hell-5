extends Node

signal globals_update
signal boss_updated

var lives: int = 5:
	set(value):
		lives = value
		globals_update.emit()

var player: CharacterBody2D:
	set(value):
		player = value
		globals_update.emit()

var boss: Node:
	set(value):
		boss = value
		boss_updated.emit(boss)
