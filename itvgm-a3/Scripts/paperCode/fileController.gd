extends Node

var ableToPickUp: bool = false
var playerName: String = "Player"
@onready var paper_sound: AudioStreamPlayer = $"../../PaperSound"

func _ready() -> void:
	$".".connect("body_entered", Callable(self, "_on_body_entered"))
	$".".connect("body_exited", Callable(self, "_on_body_exited"))
	if Global.hasCodePaper:
		$"../../File".visible = false

func _process(delta: float) -> void:
	if ableToPickUp and Input.is_action_just_pressed("Interact"):
		Global.hasCodePaper = true
		paper_sound.play()
	
func _on_body_entered(body):
	if body.name == playerName:
		if !Global.hasCodePaper:
			ableToPickUp = true
			$"../../Player/CanvasLayer/Interact".visible = true;
	
func _on_body_exited(body):
	if body.name == playerName:
		ableToPickUp = false
		$"../../Player/CanvasLayer/Interact".visible = false;
