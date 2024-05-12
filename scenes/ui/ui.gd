extends CanvasLayer

var is_paused: bool = false
@onready var pause_menu = $pause_menu

func _process(_delta):
	check_if_pause()

func check_if_pause():
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused:
			get_tree().paused = false
			deactivate_pause_ui()
		else:
			get_tree().paused = true
			activate_pause_ui()

func activate_pause_ui():
	pause_menu.visible = true

func deactivate_pause_ui():
	pause_menu.visible = false
