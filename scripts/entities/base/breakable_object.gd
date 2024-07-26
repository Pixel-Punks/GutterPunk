extends StaticBody2D

func _on_health_component_hp_reached_zero():
	var parent = get_parent()
	queue_free()
	if parent is NavigationRegion2D:
		var region = parent as NavigationRegion2D
		region.bake_navigation_polygon(false)
