extends Area2D

var interactable = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if interactable and Input.is_action_just_pressed("Interact"):
		get_tree().change_scene_to_file("res://Scenes/Levels/electrical/breakers_window.tscn")
		
func _on_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		$"../Player/CanvasLayer/Interact".visible = true;
		interactable = true


func _on_body_exited(body: Node2D) -> void:
	if "Player" in body.name:
		$"../Player/CanvasLayer/Interact".visible = false;
		interactable = false
