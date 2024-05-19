class_name Stage02MovementPattern
extends MovementPattern

var tween: Tween
var tween_vertical: Tween

func move():
	var position_tween = get_tree().create_tween()
	await position_tween.tween_property(boss, "position:y", 900, 0.5).finished

	tween = get_tree().create_tween().set_loops().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween_vertical = get_tree().create_tween().set_loops().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)

	tween_vertical.tween_property(boss, "position:y", boss.position.y + 20, 0.5).set_ease(Tween.EASE_IN)
	tween_vertical.tween_property(boss, "position:y", boss.position.y - 40, 0.5).set_ease(Tween.EASE_IN)

	tween.tween_property(boss, "position:x", 1750, 3).set_ease(Tween.EASE_IN)
	tween.tween_property(boss, "position:x", 200, 3).set_ease(Tween.EASE_IN)
	
func stop():
	tween.stop()
	tween_vertical.stop()
