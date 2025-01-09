extends Node

@onready var power_on_sfx: AudioStreamPlayer = $"../PowerOnSFX"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.elecwires_solved == false:
		$"../DoorToBreakers".locked = true
	if Global.elecwires_solved == true and Global.poweron_played == false:
		power_on_sfx.play()
		Global.poweron_played = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.elecwires_solved and $"../DoorToBreakers".locked == true:
		$"../DoorToBreakers".locked = false
