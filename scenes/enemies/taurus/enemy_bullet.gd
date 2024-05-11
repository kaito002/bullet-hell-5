extends Bullet

var rotation_tween: Tween

func _ready():
	rotation_tween = get_tree().create_tween()
	rotation_tween.tween_property(get_node("."), "rotation_degrees", 360, 0.5).from(0)
	rotation_tween.set_loops()
	rotation_tween.play()

func _on_body_entered(body: Node):
	if body.is_in_group('player'):
		body.hit()
	
func _exit_tree():
	rotation_tween.kill()
	print("removing ", name)
