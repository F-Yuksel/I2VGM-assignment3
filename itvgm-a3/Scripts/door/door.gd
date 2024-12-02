extends Area2D

var nextScene: PackedScene
var playerName: String = "Player"
var inDoorway: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inDoorway = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Interact") and inDoorway:
		if nextScene:
			get_tree().change_scene_to_packed(nextScene)
	
func _on_body_entered(body):
	if playerName == body.name:
		inDoorway = true
			
func _on_body_exited(body):
	if playerName == body.name:
		inDoorway = false
