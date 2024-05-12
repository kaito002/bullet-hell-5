extends Label

func _ready():
	Globals.connect("globals_update", set_lives_amount)

func set_lives_amount():
	text = str("LIVES: ", Globals.lives)
