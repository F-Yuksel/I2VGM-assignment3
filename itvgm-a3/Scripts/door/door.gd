extends Node2D

var nextScenePath: String  
var playerName: String = "Player"
var playerInside: bool = false


func _ready() -> void:
	$Area2D.connect("body_entered", Callable(self, "_on_body_entered"))
	$Area2D.connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if body.name == playerName:
		if name == "DoorToLQ3":
			nextScenePath = "res://Scenes/Levels/reactor/LQ3.tscn"
			Global.doorPosition = Vector2(25, -45)
		elif name == "DoorToHallwayLQ3":
			nextScenePath = "res://Scenes/Levels/reactor/reactor_hallway.tscn"
			Global.doorPosition = Vector2(150, -75)
		elif name == "DoorToLQ4":
			nextScenePath = "res://Scenes/Levels/reactor/LQ4.tscn"
			Global.doorPosition = Vector2(25, -45)
		elif name == "DoorToHallwayLQ4":
			nextScenePath = "res://Scenes/Levels/reactor/reactor_hallway.tscn"
			Global.doorPosition = Vector2(420, -75)
		elif name == "DoorToKK":
			nextScenePath = "res://Scenes/Levels/reactor/kluiskamer.tscn"
			Global.doorPosition = Vector2(0,-45)
		elif name == "DoorToHallwayKK":
			nextScenePath = "res://Scenes/Levels/reactor/reactor_hallway.tscn"
			Global.doorPosition = Vector2(650,-75)
		elif name == "DoorToHallwayLQ1":
			nextScenePath = "res://Scenes/Levels/reactor/reactor_hallway.tscn"
			Global.doorPosition = Vector2(850,-75)
		elif name == "DoorToLQ1":
			nextScenePath = "res://Scenes/Levels/reactor/LQ1.tscn"
			Global.doorPosition = Vector2(0,-75)
		
		else:
			print("Warning: Unknown door name. nextScenePath is not set.")
		playerInside = true
		 
		$"../Player/Interact".visible = true;
		print("Player entered the door area.")

func _on_body_exited(body):
	if body.name == playerName:
		playerInside = false
		$"../Player/Interact".visible = false;
		print("Player exited the door area.")

func _process(delta: float) -> void:
	if playerInside and Input.is_action_just_pressed("Interact"):
		if nextScenePath != "":
			print("Switching to scene:", nextScenePath)
			var result = get_tree().change_scene_to_file(nextScenePath)
			if result != OK:
				print("Error: Failed to load scene at path:", nextScenePath)
		else:
			print("Error: nextScenePath is not assigned!")
