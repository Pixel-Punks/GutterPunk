extends Control

@export var audio_player : AudioComponent

func _on_start_button_pressed():
	if audio_player :
		audio_player.play_random()
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")

func _on_exit_button_pressed():
	if audio_player :
		audio_player.play_random()
	get_tree().quit()

func _on_settings_button_pressed():
	if audio_player :
		audio_player.play_random()
	get_tree().change_scene_to_file("res://scenes/menues/settings_menu.tscn")
