extends Node

var playerName: String = "Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".connect("body_entered", Callable(self, "_on_body_entered"))
	$".".connect("body_exited", Callable(self, "_on_body_exited"))
	
func _on_body_entered(body):
	if body.name == playerName:
		if Global.hasSuit:
			Global.doorPosition = Vector2(0,-45)
			get_tree().change_scene_to_file("res://Scenes/Levels/reactor/reactorroom.tscn")
		else:
			$"../Player/noHazmat".visible = true

func _on_body_exited(body):
	if body.name == playerName:
		$"../Player/noHazmat".visible = false
	
