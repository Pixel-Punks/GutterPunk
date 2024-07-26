extends Control

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_exit_button_pressed():
	get_tree().quit()

func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menues/settings_menu.tscn")
