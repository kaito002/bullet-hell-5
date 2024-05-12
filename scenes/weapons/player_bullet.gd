class_name PlayerBullet
extends Bullet

func is_bullet_able_to_hit(node: Node):
	return node.is_in_group("enemies")
