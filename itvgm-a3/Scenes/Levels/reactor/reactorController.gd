extends Area2D

var playerName: String = "Player";
var ableToInterract: bool = false;

func _ready() -> void:
	$".".connect("body_entered", Callable(self, "_on_body_entered"));
	$".".connect("body_exited", Callable(self, "_on_body_exited"));

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ableToInterract and Input.is_action_just_pressed("Interact"):
		pass
	
func _on_body_entered(body):
	if body.name == playerName:
		if !Global.generatorOn:
			$"../Player/noPower".visible = true
		else:
			$"../Player/Interact".visible = true
			ableToInterract = true
		
func _on_body_exited(body):
	if body.name == playerName:
		ableToInterract = false
		$"../Player/Interact".visible = false
		$"../Player/noPower".visible = false
