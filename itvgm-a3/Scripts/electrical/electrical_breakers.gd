extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.elecbreakers_solved == false:
		$DoorToButtonMaze.locked = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.elecbreakers_solved and $"DoorToButtonMaze".locked == true:
		$"DoorToButtonMaze".locked = false
