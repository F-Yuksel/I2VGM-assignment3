extends Area2D

signal button_pressed(color: String)

@export var button_color: String = "green"

var interactable = false
var is_on = false

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if interactable and Input.is_action_just_pressed("Interact"):
		emit_signal("button_pressed", button_color)
		is_on = !is_on
		if is_on:
			animated_sprite.play("on")
		else:
			animated_sprite.play("off")


func _on_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		interactable = true	


func _on_body_exited(body: Node2D) -> void:
	if "Player" in body.name:
		interactable = false
