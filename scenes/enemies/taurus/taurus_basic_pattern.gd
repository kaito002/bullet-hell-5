class_name TaurusBasicPattern
extends FirePattern

@export var bullet_scene: PackedScene
var directions: Array[RayCast2D] = []

func _ready() -> void:
	for node in get_children():
		if node is RayCast2D:
			directions.append(node)

func fire():
	var bullet: TaurusBullet = bullet_scene.instantiate()
	bullet.position = Vector2.ZERO
	bullet.direction = Vector2.DOWN
	bullet.speed = 200
	add_child(bullet)
