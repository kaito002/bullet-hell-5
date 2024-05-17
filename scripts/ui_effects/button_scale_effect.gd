class_name ButtonScaleEffect
extends Node

var button: BaseButton

func _ready():
    button = get_parent()
    button.pivot_offset = button.size / 2
    button.button_down.connect(_on_button_down)
    button.button_up.connect(_on_button_up)


func _on_button_down():
    button.scale = Vector2(0.9, 0.9)

func _on_button_up():
    button.scale = Vector2(1, 1)


func _exit_tree():
    button.button_down.disconnect(_on_button_down)
    button.button_up.disconnect(_on_button_up)