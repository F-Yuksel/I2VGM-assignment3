extends Node

var playerName: String = "Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".connect("body_entered", Callable(self, "_on_body_entered"))
	
func _on_body_entered(body):
	if body.name == playerName:
		Global.doorPosition = Vector2(0,-45)
		get_tree().change_scene_to_file("res://Scenes/Levels/reactor/reactorroom.tscn")
