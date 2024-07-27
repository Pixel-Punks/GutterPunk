extends State

class_name RatIdle

@export var pathfinding : PathFindingComponent
@export var shrinking_sprite : ShrinkingSpriteComponent

func _ready():
	pathfinding.player_detected.connect(switch_to_follow)
	
func enter():
	shrinking_sprite.initialize()

func exit():
	shrinking_sprite.reset()

func switch_to_follow():
	Transitioned.emit(self, "follow")
