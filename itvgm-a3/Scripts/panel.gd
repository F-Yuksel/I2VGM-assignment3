extends Area2D

var in_body = false
signal power

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if in_body and Input.is_action_just_pressed("Interact"):
		if $"../Player/Inventory".remove_item($BatteryItem):
			emit_signal("power", true)
			$CollisionShape2D.disabled = true
			$"../Player/Interact".visible = false
			in_body = false
			$LineOn.visible = true
			$LineOff.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body == $"../Player":
		$"../Player/Interact".visible = true
		in_body = true


func _on_body_exited(body: Node2D) -> void:
	if body == $"../Player":
		$"../Player/Interact".visible = false
		in_body = false
