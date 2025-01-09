extends Area2D

@export var flip_h : bool
@export var flip_v : bool
@onready var leverflipsfx: AudioStreamPlayer = $"../LeverFlip"

signal power_a
signal power_b

var in_body = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.elecbreakers_solved:
		$A_on.visible = true
		$A_off.visible = false
		$B_on.visible = false
		$B_off.visible = true
		emit_signal("power_a", true)
		emit_signal("power_b", false)
	else:
		$A_on.visible = false
		$A_off.visible = true
		$B_on.visible = false
		$B_off.visible = true
		emit_signal("power_a", false)
		emit_signal("power_b", false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if in_body and Input.is_action_just_pressed("Interact"):
		leverflipsfx.play()
		$Sprite2D.flip_h = not $Sprite2D.flip_h
		$A_on.visible = not $A_on.visible
		$A_off.visible = not $A_off.visible
		$B_on.visible = not $B_on.visible
		$B_off.visible = not $B_off.visible
		if flip_h:
			$Switch.flip_h = not $Switch.flip_h
		if flip_v:
			$Switch.flip_v = not $Switch.flip_v
		emit_signal("power_a", $A_on.visible)
		emit_signal("power_b", $B_on.visible)


func _on_body_entered(body: Node2D) -> void:
	if body == $"../Player":
		$"../Player/CanvasLayer/Interact".visible = true
		in_body = true


func _on_body_exited(body: Node2D) -> void:
	if body == $"../Player":
		$"../Player/CanvasLayer/Interact".visible = false
		in_body = false
