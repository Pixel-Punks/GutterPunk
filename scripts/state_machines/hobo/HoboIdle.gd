extends State

class_name HoboIdle

@export var pathfinding : PathFindingComponent
@export var shrinking_sprite : ShrinkingSpriteComponent
@export var audio_player : AudioComponent

func _ready():
	pathfinding.player_detected.connect(switch_to_follow)
	
func enter():
	shrinking_sprite.initialize()
	if randi() % 100 + 1 == 1:
		if audio_player :
			audio_player.play_random()

func exit():
	shrinking_sprite.reset()

func switch_to_follow():
	Transitioned.emit(self, "follow")
