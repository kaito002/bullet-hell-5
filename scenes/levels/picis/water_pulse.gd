class_name WaterPulse
extends AnimatedSprite2D

var _should_execute: bool = false

func start():
    _should_execute = true


func finish():
    _should_execute = false


func _process(delta):
    
