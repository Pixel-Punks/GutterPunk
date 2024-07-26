extends StaticBody2D

func _on_health_component_hp_reached_zero():
	queue_free()
	var parent = get_parent()
	if parent is NavigationRegion2D:
		var region = parent as NavigationRegion2D
		region.bake_navigation_polygon(false)
