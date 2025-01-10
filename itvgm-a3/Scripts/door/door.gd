extends Node2D

var playerName: String = "Player"
var playerInside: bool = false
var locked: bool = false
var global_inventory = GlobalInventory

@export var nextScenePath: String
@export var Coords: Vector2
@export var Locked: bool
@export var ElectricityNeeded: bool
@export var BreakersNeeded: bool
@export var itemNeeded: String

@onready var openSFX: AudioStreamPlayer = $Open
@onready var lockedSFX: AudioStreamPlayer = $Locked

func _ready() -> void:
	$Area2D.connect("body_entered", Callable(self, "_on_body_entered"))
	$Area2D.connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if body.name == playerName:
		Global.doorPosition = Coords
		playerInside = true
		 
		$"../Player/CanvasLayer/Interact".visible = true;
		print("Player entered the door area.")

func _on_body_exited(body):
	if body.name == playerName:
		playerInside = false
		$"../Player/CanvasLayer/Interact".visible = false;
		print("Player exited the door area.")

func _process(delta: float) -> void:
	if playerInside and Input.is_action_just_pressed("Interact"):
		if Locked:
			if ElectricityNeeded:
				if !Global.elecwires_solved:
					$"../Player/CanvasLayer/Notification".text = "Door is locked! Fix the electricity to unlock!"
					$"../Player/CanvasLayer/Notification".visible = true;
					$"../Player/CanvasLayer/Notification/NotificationPlayer".play("fade_out")
					return
				else:
					pass
				#print("Item is ", itemNeeded)
			elif BreakersNeeded:
				if !Global.elecbreakers_solved:
					$"../Player/CanvasLayer/Notification".text = "Door is locked! Fix the faulty breakers to unlock!"
					$"../Player/CanvasLayer/Notification".visible = true;
					$"../Player/CanvasLayer/Notification/NotificationPlayer".play("fade_out")
					return
				else:
					pass
			elif !global_inventory.check_item_name(itemNeeded):
				var Notif = "Door is locked! Use {str} to unlock!"
				var NotifVar = Notif.format({"str": itemNeeded})
				lockedSFX.play()
				$"../Player/CanvasLayer/Notification".text = NotifVar
				$"../Player/CanvasLayer/Notification".visible = true;
				$"../Player/CanvasLayer/Notification/NotificationPlayer".play("fade_out")
				return
		if nextScenePath != "":
			openSFX.play()
			TransitionScene.transition()
			await TransitionScene.on_transition_finished
			print("Switching to scene:", nextScenePath)
			var result = get_tree().change_scene_to_file(nextScenePath)
			if result != OK:
				print("Error: Failed to load scene at path:", nextScenePath)
		else:
			print("Error: nextScenePath is not assigned!")
