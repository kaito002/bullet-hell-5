extends Bullet


func _on_body_entered(body):
	print(body, " collision with ", name)
