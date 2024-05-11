extends CanvasLayer

var is_paused: bool = false

func _process(_delta):
	check_if_pause()

func check_if_pause():
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused:
			get_tree().paused = false
			print("unpaused")
		else:
			get_tree().paused = true
			print("paused")
	
