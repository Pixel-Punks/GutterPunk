extends Control

@export var audio_player : AudioComponent

func _on_button_pressed():
	if audio_player :
		audio_player.play_random()
	get_tree().change_scene_to_file("res://scenes/menues/start_menu.tscn")
