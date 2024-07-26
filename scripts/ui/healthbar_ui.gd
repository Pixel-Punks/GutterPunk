extends CenterContainer
class_name  HealthBarUi

var max_health: int = 100.0

func _ready():
	%OverBar.value = max_health
	%UnderBar.value = max_health

func update_health(_value: int) -> void:
	max_health = _value
	var tween = create_tween()
	tween.tween_property(%OverBar, "value", max_health, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(%UnderBar, "value", max_health, 0.25).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
