extends Control

@export var audio_player : AudioComponent

func _on_resume_pressed():
	if audio_player :
		audio_player.play_random()
	hide()
	get_tree().paused = false

func _on_exit_button_pressed():
	if audio_player :
		audio_player.play_random()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menues/start_menu.tscn")

func _on_settings_button_pressed():
	if audio_player :
		audio_player.play_random()
	get_node("TextureRect/PauseBox").hide()
	get_node("TextureRect/SettingsBox").show()

func _on_button_pressed():
	if audio_player :
		audio_player.play_random()
	get_node("TextureRect/SettingsBox").hide()
	get_node("TextureRect/PauseBox").show()

func _on_player_pause():
	get_tree().paused = true
	show()
