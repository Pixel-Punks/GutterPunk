extends Node2D

class_name BacCompoenent

@export var MAX_BAC : int = 100

@export var BAC_MALUS : int = 25

@export var DEFAULT_BAC : int = 0

@export var bac_bar : ProgressBarUi

@export var audio_player : AudioComponent

signal bac_reached_max()
signal alcool()

var bac : int

# Called when the node enters the scene tree for the first time.
func _ready():
	bac = DEFAULT_BAC
	if bac_bar:
		bac_bar.update_value(bac)

func drink():
	bac += BAC_MALUS
	if audio_player :
		audio_player.play_random()
	if bac_bar:
		bac_bar.update_value(bac)

	if bac >= MAX_BAC:
		bac_reached_max.emit()
		return
	alcool.emit()
