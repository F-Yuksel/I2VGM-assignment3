extends Area2D

@export var flip_h : bool
@export var flip_v : bool

signal power_a
signal power_b

var in_body = false
var has_power = true
var is_a = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$A_on.visible = true
	$A_off.visible = false
	$B_on.visible = false
	$B_off.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if in_body and Input.is_action_just_pressed("Interact") and has_power:
		$Sprite2D.flip_h = not $Sprite2D.flip_h
		$A_on.visible = not is_a
		$A_off.visible = is_a
		$B_on.visible = is_a
		$B_off.visible = not is_a
		if flip_h:
			$SwitchOn.flip_h = not $SwitchOn.flip_h
			$SwitchOff.flip_h = not $SwitchOff.flip_h
		if flip_v:
			$SwitchOn.flip_v = not $SwitchOn.flip_v
			$SwitchOff.flip_v = not $SwitchOff.flip_v
		emit_signal("power_a", $A_on.visible)
		emit_signal("power_b", $B_on.visible)
		is_a = not is_a


func _on_body_entered(body: Node2D) -> void:
	if body == $"../Player" and has_power:
		$"../Player/CanvasLayer/Interact".visible = true
		in_body = true


func _on_body_exited(body: Node2D) -> void:
	if body == $"../Player":
		$"../Player/CanvasLayer/Interact".visible = false
		in_body = false
		

func _on_lever_power(is_on : bool) -> void:
	if is_on:
		has_power = true
		$A_on.visible = is_a
		$A_off.visible = not is_a
		$B_on.visible = not is_a
		$B_off.visible = is_a
		$SwitchOff.visible = false
		$SwitchOn.visible = true
		if is_a:
			emit_signal("power_a", true)
		else:
			emit_signal("power_b", true)
	else:
		has_power = false
		$A_on.visible = false
		$A_off.visible = true
		$B_on.visible = false
		$B_off.visible = true
		$SwitchOff.visible = true
		$SwitchOn.visible = false
		if is_a:
			emit_signal("power_a", false)
		else:
			emit_signal("power_b", false)
		
		
