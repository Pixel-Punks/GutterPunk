extends Control

func _on_resume_pressed():
	hide()
	get_tree().paused = false

func _on_player_pause_menu():
	get_tree().paused = true
	show()

func _on_exit_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menues/start_menu.tscn")