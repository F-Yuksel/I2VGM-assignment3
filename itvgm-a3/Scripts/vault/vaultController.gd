extends Node

var playerName: String = "Player";
var ableToInterract: bool = false;
@onready var vault_open: AudioStreamPlayer = $"../../VaultOpen"
@onready var suit_on: AudioStreamPlayer = $"../../SuitOn"

func _ready() -> void:
	$".".connect("body_entered", Callable(self, "_on_body_entered"));
	$".".connect("body_exited", Callable(self, "_on_body_exited"));
	if Global.hasSuit:
		vault_open.play()
		suit_on.play()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ableToInterract and Input.is_action_just_pressed("Interact"):
		get_tree().change_scene_to_file("res://Scenes/Levels/reactor/keypad.tscn")
	
func _on_body_entered(body):
	if body.name == playerName:
		$"../../Player/Interact".visible = true
		ableToInterract = true
		
func _on_body_exited(body):
	if body.name == playerName:
		ableToInterract = false
		$"../../Player/Interact".visible = false
