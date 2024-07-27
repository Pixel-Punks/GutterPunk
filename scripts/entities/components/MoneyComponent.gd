extends Node2D

class_name MoneyComponent

@export var MAX_MONEY: int = 99

@export var DEFAULT_MONEY : int = 0

@export var player_money_bar : CenterContainer

@export var audio_money : AudioComponent


var amount : int

# Called when the node enters the scene tree for the first time.
func _ready():
	amount = DEFAULT_MONEY
	if player_money_bar:
		player_money_bar.get_child()

func took_money():
	overdose += DRUG_MALUS
	if audio_player :
		audio_player.play_random()
	if overdose_bar:
		overdose_bar.update_value(overdose)

	if overdose >= MAX_OVERDOSE:
		overdose_reached_max.emit()
		return
	drug.emit()
