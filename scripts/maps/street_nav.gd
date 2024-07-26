extends NavigationRegion2D

@export var tile_size : int = 16
@export var tile_scale : int = 5
@export var map_width : int = 10
@export var map_height : int = 12

@export var upper_street : PackedScene
@export var middle_streets : Array[StreetParts]
@export var lower_street : PackedScene

var map_needs_update : bool = false

func _ready():
	var fragments = 100
	var width = map_width * tile_size * tile_scale
	var height = generate_map(fragments)
	create_navigation_polygon(width, height)
	place_player(width/2, height - tile_size*tile_scale)

func generate_map(fragments : int) -> int:
	var current_y = 0
	place_street(current_y, upper_street)
	current_y += map_height * tile_size * tile_scale + 1
	for i in range(fragments):
		var random_street : StreetParts = middle_streets[randi() % middle_streets.size()]
		place_street(current_y, random_street.scene)
		current_y += random_street.height * tile_size * tile_scale
	place_street(current_y, lower_street)
	current_y += map_height * tile_size * tile_scale + 1
	return current_y

func place_street(y_position : int, map_scene : PackedScene):
	var map_piece = map_scene.instantiate()
	add_child(map_piece)
	map_piece.position.y = y_position
	map_piece.z_index = 0

func create_navigation_polygon(width : int, height : int):
	var bounding_outline = PackedVector2Array([
		Vector2(0, 0), 
		Vector2(0, height), 
		Vector2(width, height), 
		Vector2(width, 0) 
	])
	navigation_polygon.clear_outlines()
	navigation_polygon.add_outline(bounding_outline)
	navigation_polygon.agent_radius = 80
	navigation_polygon.cell_size = tile_size * tile_scale
	NavigationServer2D.bake_from_source_geometry_data(navigation_polygon, NavigationMeshSourceGeometryData2D.new());
	bake_navigation_polygon()

func place_player(x_pos : int, y_pos : int) -> void :
	var player = load("res://scenes/entities/player.tscn").instantiate()
	add_child(player)
	player.scale = Vector2(tile_scale, tile_scale)
	player.position = Vector2(x_pos, y_pos)

func _on_bake_finished():
	if map_needs_update:
		bake_navigation_polygon()


func _on_child_exiting_tree(node):
	map_needs_update = true
