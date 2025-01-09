extends Area2D

var in_body = false
var has_power = true
var playerName: String = "Player"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if has_power and in_body and Input.is_action_just_pressed("Interact"):
		$CollisionShape2D.disabled = true
		$"../Player/CanvasLayer/Interact".visible = false
		$"../Player/CanvasLayer/TextBox".visible = true
		await get_tree().create_timer(3.0).timeout
		$"../Player/CanvasLayer/TextBox".visible = false
	if has_power:
		$comscreen/error.visible = false
	else:
		$comscreen/error.visible = true
	
	if Global.coordsGet:
		$comscreen/fixed.visible = true
func _on_body_entered(body: Node2D):
	if body.name == playerName and has_power:
		var interact_screen = body.get_node("CanvasLayer/Interact")
		print(interact_screen)
		in_body = true
		interact_screen.visible = true

func _on_body_exited(body: Node2D):
	if body.name == playerName:
		print("Where u going cuz")
		var interact_screen = body.get_node("CanvasLayer/Interact")
		in_body = false
		interact_screen.visible = false

func _on_lever_power(is_on) -> void:
	has_power = is_on
	print("LEVER IS ON")
