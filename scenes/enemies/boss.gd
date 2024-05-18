class_name Boss
extends Area2D

signal finished_intro()

@export var movement_animator: AnimationPlayer
@export var sprites_animator: AnimationPlayer

func _ready() -> void:
	movement_animator.animation_finished.connect(on_animation_finished)


func on_animation_finished(animation_name: String):
	match animation_name:
		"intro":
			finished_intro.emit()
			movement_animator.play("stage_01")
			sprites_animator.play("stage_01")
		_: pass
