class_name TaurusBullet
extends Bullet

@onready var sprite: Sprite2D = $NoseRing

func _process(delta: float) -> void:
	sprite.rotate(2*PI * delta)
	position += speed * direction * delta


func _on_body_entered(body):
	if body.is_in_group('player'):
		body.hit()
