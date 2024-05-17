extends TextureButton


func _on_pressed():
	get_tree().create_timer(0.25).timeout.connect(func(): get_tree().change_scene_to_file("res://scenes/levels/main.tscn"))
