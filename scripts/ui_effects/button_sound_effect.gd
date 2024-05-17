class_name ButtonSoundEffect
extends Node

@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer
@export var sfx_audio: AudioStream

var button: BaseButton

func _ready():
    button = get_parent()
    audio_player.stream = sfx_audio
    button.pressed.connect(_on_button_pressed)


func _on_button_pressed():
    audio_player.play()


func _exit_tree():
    button.pressed.disconnect(_on_button_pressed)
