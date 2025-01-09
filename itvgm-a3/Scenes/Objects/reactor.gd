extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.reactorOn:
		$reactoroff.visible = false
		$reactoron.visible = true
	else:
		$reactoroff.visible = true
		$reactoron.visible = false
