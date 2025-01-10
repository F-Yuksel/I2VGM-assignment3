extends Area2D

var interactable = false
var is_showing = false

@onready var controls: Sprite2D = $Controls
@onready var label: Label = $Label
@onready var bg: ColorRect = $BG

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	controls.visible = false
	label.visible = false
	bg.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if interactable and Input.is_action_just_pressed("Interact"):
		is_showing = !is_showing
		controls.visible = is_showing
		label.visible = is_showing
		bg.visible = is_showing


func _on_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		$"../Player/CanvasLayer/Interact".visible = true;
		interactable = true


func _on_body_exited(body: Node2D) -> void:
	if "Player" in body.name:
		$"../Player/CanvasLayer/Interact".visible = false;
		interactable = false
