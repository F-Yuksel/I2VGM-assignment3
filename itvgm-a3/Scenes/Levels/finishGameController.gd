extends Area2D

var ableToInterract: bool = false
var playerName: String = "Player"
var ableToFinish: bool = false

func _ready() -> void:
	$".".connect("body_entered", Callable(self, "_on_body_entered"))
	$".".connect("body_exited", Callable(self, "_on_body_exited"))
	if Global.electrical_allsolved and Global.messageSent and Global.reactorOn:
		ableToFinish = true

func _process(delta: float) -> void:
	if ableToInterract and Input.is_action_just_pressed("Interact"):
		TransitionScene.transition_slow()
		await TransitionScene.on_transition_finished
		get_tree().change_scene_to_file("res://Scenes/game_end_screen.tscn")
	
func _on_body_entered(body):
	if body.name == playerName:
		if ableToFinish:
			$"../Player/CanvasLayer/Interact".visible = true
			ableToInterract = true
		
func _on_body_exited(body):
	if body.name == playerName:
		ableToInterract = false
		$"../Player/CanvasLayer/Interact".visible = false
