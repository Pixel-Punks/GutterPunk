extends State

class_name RatFollow

@export var pathfinding : PathFindingComponent
@export var body : CharacterBody2D
@export var oscillating_component : OscillatingSpriteComponent
@export var attack_range : float = 32*5

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
	pathfinding.stop_following()
	Transitioned.emit(self, "idle")

func switch_to_attack():
	pathfinding.stop_following()
	Transitioned.emit(self, "attack")
	
func exit():
	oscillating_component.reset()
	
func update(_delta):
	if !pathfinding.player:
		return
	if pathfinding.player.global_position.distance_to(body.global_position) < attack_range:
		switch_to_attack()
		return
	follow_player()
