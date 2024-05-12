extends Node

signal globals_update

var lives: int = 5:
	set(value):
		lives = value
		globals_update.emit()
