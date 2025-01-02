extends Area2D

var in_body = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if in_body and Input.is_action_just_pressed("Interact"):
		$"../Player/Inventory".add_item($Item)
		$CollisionShape2D.disabled = true
		$"../Player/Interact".visible = false
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body == $"../Player":
		$"../Player/Interact".visible = true
		in_body = true

func _on_body_exited(body: Node2D) -> void:
	if body == $"../Player":
		$"../Player/Interact".visible = false
		in_body = false
