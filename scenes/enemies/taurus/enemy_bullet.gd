extends Bullet


func _on_body_entered(body: Node):
	if body.is_in_group('player'):
		print(body, " collision with ", name)
	