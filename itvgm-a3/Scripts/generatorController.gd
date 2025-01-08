extends Area2D

var playerName: String = "Player";
var ableToInterract: bool = false;
@onready var generetor_sound: AudioStreamPlayer = $"../GeneretorSound"

func _ready() -> void:
	$".".connect("body_entered", Callable(self, "_on_body_entered"))
	$".".connect("body_exited", Callable(self, "_on_body_exited"))
	if Global.generatorOn:
		generetor_sound.play()
		
func _process(delta: float) -> void:
	if ableToInterract and Input.is_action_just_pressed("Interact"):
		get_tree().change_scene_to_file("res://Scenes/Levels/reactor/wires_window_amogus.tscn")	
func _on_body_entered(body):
	if body.name == playerName and !Global.generatorOn:
		$"../Player/Interact".visible = true
		ableToInterract = true
		
func _on_body_exited(body):
	if body.name == playerName:
		ableToInterract = false
		$"../Player/Interact".visible = false
