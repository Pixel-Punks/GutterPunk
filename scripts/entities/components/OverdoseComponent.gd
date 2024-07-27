extends Node2D

class_name OverdoseComponent

@export var MAX_OVERDOSE : int = 100

@export var DRUG_MALUS : int = 25

@export var DEFAULT_OVERDOSE : int = 0

@export var overdose_bar : ProgressBarUi

@export var audio_player : AudioComponent

signal overdose_reached_max()
signal drug()

var overdose : int

# Called when the node enters the scene tree for the first time.
func _ready():
	overdose = DEFAULT_OVERDOSE
	if overdose_bar:
		overdose_bar.update_value(overdose)

func took_drugs():
	overdose += DRUG_MALUS
	if audio_player :
		audio_player.play_random()
	if overdose_bar:
		overdose_bar.update_value(overdose)

	if overdose >= MAX_OVERDOSE:
		overdose_reached_max.emit()
		return
	drug.emit()
