extends Node

var ableToPickUp: bool = false
var playerName: String = "Player"

func _ready() -> void:
	$".".connect("body_entered", Callable(self, "_on_body_entered"))
	$".".connect("body_exited", Callable(self, "_on_body_exited"))
	if Global.hasCodePaper:
		$"../../File".visible = false

func _process(delta: float) -> void:
	if ableToPickUp and Input.is_action_just_pressed("Interact"):
		$"../../Player/CodePaper".visible = true
		$"../../Player".ableToMove = false
	elif ableToPickUp and Input.is_action_just_pressed("exit"):
		$"../../Player".ableToMove = true
		$"../../Player/CodePaper".visible = false
		$"../../File".visible = false
		Global.hasCodePaper = true
	
func _on_body_entered(body):
	if body.name == playerName:
		if !Global.hasCodePaper:
			ableToPickUp = true
			$"../../Player/Interact".visible = true;
	
func _on_body_exited(body):
	if body.name == playerName:
		ableToPickUp = false
		$"../../Player/Interact".visible = false;
