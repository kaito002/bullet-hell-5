class_name Bullet
extends Node2D

@export var speed: float = 750.0
var direction: Vector2 = Vector2.UP

func _physics_process(delta):
	position += direction * speed * delta


func _on_area_entered(area: Node):
	if is_bullet_able_to_hit(area):
		var health_component: HealthComponent = area.get_node("./health_component")
		if health_component != null:
			deal_damage(health_component)
		else:
			push_error(area.name, " does not have a health_component!")
		call_deferred("queue_free")


func _on_body_entered(body):
	if is_bullet_able_to_hit(body):
		body.hit()
		call_deferred("queue_free")

func deal_damage(health_component: HealthComponent):
	health_component.hit()

func is_bullet_able_to_hit(_node: Node):
	pass
