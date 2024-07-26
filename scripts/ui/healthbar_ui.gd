extends CenterContainer
class_name  HealthBarUi

var health: int = 100

@export var over_bar: TextureProgressBar
@export var under_bar: TextureProgressBar

func _ready():
	over_bar.value = health
	under_bar.value = health

func update_health(_value: int) -> void:
	health = _value
	var tween = create_tween()
	tween.tween_property(over_bar, "value", health, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(under_bar, "value", health, 0.25).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
