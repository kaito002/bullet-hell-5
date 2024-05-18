class_name WaterPulses
extends Node2D

var even_pulses: Array[Node2D] = []
var odd_pulses: Array[Node2D] = []

var even_tweens: Array[Tween] = []

func _ready():
	_separate_pulses()
	_start_even_pulses()

func _separate_pulses():
	var idx = 0
	for child in get_children():
		if idx % 2 == 0:
			even_pulses.append(child)
		else:
			odd_pulses.append(child)
		idx += 1

func _start_odd_pulses():
	for pulse in odd_pulses:
		var tween = get_tree().create_tween()
		tween.tween_property(pulse, "position", Vector2(pulse.position.x, 600), 4)

	get_tree().create_timer(4).timeout.connect(_on_finished_odd)


func _start_even_pulses():
	for pulse in even_pulses:
		var tween = get_tree().create_tween()
		tween.tween_property(pulse, "position", Vector2(pulse.position.x, 600), 4)

	get_tree().create_timer(4).timeout.connect(_on_finished_even)

func _on_finished_even():
	for pulse in even_pulses:
		var tween = get_tree().create_tween()
		tween.tween_property(pulse, "position", Vector2(pulse.position.x, 1850), 4)

	get_tree().create_timer(4).timeout.connect(_start_odd_pulses)

func _on_finished_odd():
	for pulse in odd_pulses:
		var tween = get_tree().create_tween()
		tween.tween_property(pulse, "position", Vector2(pulse.position.x, 1850), 4)

	get_tree().create_timer(4).timeout.connect(_start_even_pulses)
