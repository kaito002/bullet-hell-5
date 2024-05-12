extends State

@export var speed: float = 500
var player: Node2D

func _ready():
	player = Globals.player

func state_process(delta):
	if is_near_player(): return
	var dir = node.global_position.direction_to(player.global_position)
	node.position += dir * speed * delta

func is_near_player():
	return node.global_position.distance_to(player.global_position) < 500
