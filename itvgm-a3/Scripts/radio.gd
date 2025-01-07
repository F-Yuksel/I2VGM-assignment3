extends Area2D

var in_body = false
var has_power = true
var playerName: String = "Player"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if has_power and in_body and Input.is_action_just_pressed("Interact"):
		$CollisionShape2D.disabled = true
		$"../Player/Interact".visible = false
		$"../Player/TextBox".visible = true
		await get_tree().create_timer(3.0).timeout
		$"../Player/TextBox".visible = false


func _on_body_entered(body: Node2D):
	if body.name == playerName and has_power:
		var interact_screen = body.get_node("Interact")
		print(interact_screen)
		in_body = true
		interact_screen.visible = true

func _on_body_exited(body: Node2D):
	if body.name == playerName:
		print("Where u going cuz")
		var interact_screen = body.get_node("Interact")
		in_body = false
		interact_screen.visible = false

func _on_lever_power(is_on) -> void:
	has_power = is_on
	print("LEVER IS ON")
