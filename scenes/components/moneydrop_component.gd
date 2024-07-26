extends Node2D

@onready var drop = preload("res://scenes/entities/coin.tscn")

func _on_tree_exiting():
	var rng = RandomNumberGenerator.new()
	var rnd = rng.randi_range(1,2)
	if rnd == 2:
		var parent = get_parent()
		var coin = drop.instantiate()
		var pos = parent.global_position
		parent = parent.get_parent()
		get_tree().root.add_child(coin)
		coin.global_position = global_position
