class_name Picis
extends Boss

@onready var picis_weapon: BossWeapon = $picis_weapon


func _ready() -> void:
	super._ready()
	finished_intro.connect(on_finished_intro)

func on_finished_intro():
	picis_weapon.start_shooting()
