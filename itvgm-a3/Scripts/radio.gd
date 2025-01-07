extends Area2D

var in_body = false
var has_power = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if has_power and in_body and Input.is_action_just_pressed("Interact"):
		$CollisionShape2D.disabled = true
		$"../Player/Interact".visible = false
		$"../Player/TextBox".visible = true
		await get_tree().create_timer(3.0).timeout
		$"../Player/TextBox".visible = false


func _on_body_entered(body: Node2D) -> void:
	if body == $"../Player" and has_power:
		$"../Player/Interact".visible = true
		in_body = true

func _on_body_exited(body: Node2D) -> void:
	if body == $"../Player":
		$"../Player/Interact".visible = false
		in_body = false

func _on_lever_power(is_on) -> void:
	has_power = is_on
