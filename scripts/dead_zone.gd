extends Area2D


func _on_area_entered(area):
	area.call_deferred("queue_free")
