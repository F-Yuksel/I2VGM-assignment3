extends Area2D

var interactable = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if interactable and Input.is_action_just_pressed("Interact"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		$"../Player/Camera2D2/HUD_breakers".set_visibility_recursive($"../Player/Camera2D2/HUD_breakers/BreakersWindow", true)
		$"../Player".ableToMove = false
	if interactable and Input.is_action_just_pressed("exit"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		$"../Player/Camera2D2/HUD_breakers".close_menu()
		$"../Player".ableToMove = true
		
func _on_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		$"../Player/Interact".visible = true;
		interactable = true


func _on_body_exited(body: Node2D) -> void:
	if "Player" in body.name:
		$"../Player/Interact".visible = false;
		interactable = false
