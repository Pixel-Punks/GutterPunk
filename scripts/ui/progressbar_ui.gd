extends CenterContainer
class_name  ProgressBarUi

var value: int = 0

func _ready():
	$OverBar.value = value
	$UnderBar.value = value

func update_health(_value: int) -> void:
	value = _value
	var tween = create_tween()
	tween.tween_property($OverBar, "value", value, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($UnderBar, "value", value, 0.25).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
