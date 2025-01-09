extends Area2D

var interactable = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if interactable and Input.is_action_just_pressed("Interact"):
		Global.elecbuttons_solved = true
		Global.electrical_allsolved = true
		interactable = false
		$"../buttonlogic".openall()
		$"../Player/CanvasLayer/Interact".visible = false


func _on_body_entered(body: Node2D) -> void:
	if "Player" in body.name and Global.electrical_allsolved == false:
		$"../Player/CanvasLayer/Interact".visible = true;
		interactable = true


func _on_body_exited(body: Node2D) -> void:
	if "Player" in body.name and Global.electrical_allsolved == false:
		$"../Player/CanvasLayer/Interact".visible = false;
		interactable = false
