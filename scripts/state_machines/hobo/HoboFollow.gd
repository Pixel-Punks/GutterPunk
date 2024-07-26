extends State

class_name HoboFollow

@export var pathfinding : PathFindingComponent
@export var body : CharacterBody2D
@export var oscillating_component : OscillatingSpriteComponent

var previous_distance_to_player : float = 0
var distance_to_player : float = 0

func _ready():
	pathfinding.player_lost.connect(switch_to_idle)

func enter():
	oscillating_component.initialize()
	follow_player()

func follow_player():
	pathfinding.start_following()

func switch_to_idle():
	Transitioned.emit(self, "idle")

func exit():
	oscillating_component.reset()
	
func update(_delta):
	if !pathfinding.player:
		return
	follow_player()
