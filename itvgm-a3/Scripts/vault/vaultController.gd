extends Node

var playerName: String = "Player";
var ableToInterract: bool = false;

func _ready() -> void:
	$".".connect("body_entered", Callable(self, "_on_body_entered"));
	$".".connect("body_exited", Callable(self, "_on_body_exited"));

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ableToInterract and Input.is_action_just_pressed("Interact"):
		$"../../Player/Keypad".visible = true;
		$"../../Player".ableToMove = false;
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func _on_body_entered(body):
	if body.name == playerName:
		$"../../Player/Interact".visible = true
		ableToInterract = true
		
func _on_body_exited(body):
	if body.name == playerName:
		ableToInterract = false
		$"../../Player/Interact".visible = false
