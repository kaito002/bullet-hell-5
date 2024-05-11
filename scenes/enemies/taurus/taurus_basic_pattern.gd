class_name TaurusBasicPattern
extends FirePattern

@export var bullet_scene: PackedScene
@export var directions: Array[Vector2] = []

func fire():
	for direction in directions:
		var bullet: TaurusBullet = bullet_scene.instantiate()
		bullet.position = Vector2.ZERO
		bullet.direction = direction
		bullet.speed = 350
		add_child(bullet)
