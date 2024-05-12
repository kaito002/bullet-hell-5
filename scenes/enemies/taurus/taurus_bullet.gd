class_name TaurusBullet
extends EnemyBullet

@onready var sprite: Sprite2D = $NoseRing

func _process(delta: float):
	sprite.rotate(2*PI * delta)
