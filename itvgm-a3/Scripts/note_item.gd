extends Area2D

var interactable = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if interactable and Input.is_action_just_pressed("Interact"):
		if name == "Note1":
			$"../../Player/Camera2D2/HUD_breakers/NoteElectrical".note_text("The sequence is all mixed up, though 1 did still come before 2.")
		elif name == "Note2":
			$"../../Player/Camera2D2/HUD_breakers/NoteElectrical".note_text("My favorite number is 2, and I know for sure it wasn’t in the first half of the breaker sequence. Poor 2...")
		elif name == "Note4":
			$"../../Player/Camera2D2/HUD_breakers/NoteElectrical".note_text("I don't remember the breaker order, but I think it started with a 4?")
		elif name == "Note5":
			$"../../Player/Camera2D2/HUD_breakers/NoteElectrical".note_text("The order is so hard to remember. I'm pretty sure 5 came later though.")
		
		$"../../Player/Camera2D/HUD_breakers".set_visibility_recursive($"../../Player/Camera2D/HUD_breakers/NoteElectrical", true)
		$"../../Player/Camera2D/HUD_breakers".show_closebutton()


func _on_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		$"../../Player/Interact".visible = true
		interactable = true


func _on_body_exited(body: Node2D) -> void:
	if "Player" in body.name:
		$"../../Player/Interact".visible = false
		interactable = false
