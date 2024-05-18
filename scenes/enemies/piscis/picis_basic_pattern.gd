class_name PicisBasicPattern
extends FirePattern

@export var bullet_scene: PackedScene

func fire():
	if Globals.player == null: return

	var bullet: Bullet = bullet_scene.instantiate()
	bullet.position = global_position
	bullet.direction = Vector2(Globals.player.global_position.x - global_position.x, Globals.player.global_position.y - global_position.y).normalized()
	bullet.speed = 300
	get_tree().root.add_child(bullet)
