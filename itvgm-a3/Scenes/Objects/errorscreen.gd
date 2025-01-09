extends Node2D


func _process(delta: float) -> void:
	if Global.generatorOn:
		$error.visible = false
		$fixed.visible = true
	else:
		$error.visible = true
		$fixed.visible = false
