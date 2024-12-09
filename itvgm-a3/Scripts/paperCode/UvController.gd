extends Node

var ableToUse: bool = false
var playerName: String = "Player"

func _ready() -> void:
	$".".connect("body_entered", Callable(self, "_on_body_entered"))
	$".".connect("body_exited", Callable(self, "_on_body_exited"))

func _process(delta: float) -> void:
	if ableToUse and Input.is_action_just_pressed("Interact"):
		$"../../Player/PaperCode".visible = true
		$"../../Player".ableToMove = false
	elif ableToUse and Input.is_action_just_pressed("exit"):
		$"../../Player/PaperCode".visible = false
		$"../../Player".ableToMove = true
	
func _on_body_entered(body):
	if body.name == playerName:
		if Global.hasCodePaper:
			ableToUse = true
			$"../../Player/Interact".visible = true;
	
func _on_body_exited(body):
	if body.name == playerName:
		ableToUse = false
		$"../../Player/Interact".visible = false;
