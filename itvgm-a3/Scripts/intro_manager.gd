extends Node

var rng = RandomNumberGenerator.new()

var last_pitch = 2.0
var pitch_scale

var currline = 0
var textisshown = false

@onready var textanimator: AnimationPlayer = $"../TextAnimator"
@onready var text_delay: Timer = $"../TextDelay"
@onready var typing_sound: AudioStreamPlayer = $"../Typing_Sound"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	textanimator.play("onload")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if textisshown or Input.is_action_just_pressed("Jump"):
		TransitionScene.transition_slow()
		await TransitionScene.on_transition_finished
		get_tree().change_scene_to_file("res://Scenes/Levels/test_scene.tscn")


func start_textdelay() -> void:
	text_delay.start()

func start_typing() -> void:
	# Randomize typing sound pitch
	pitch_scale = rng.randf_range(1.8, 2.2)
	while abs(last_pitch - pitch_scale) < 0.1: # Prevents repetitive typing noise
		pitch_scale = rng.randf_range(1.8, 2.2)
	typing_sound.pitch_scale = pitch_scale
	typing_sound.play()
	last_pitch = pitch_scale # Stores previous value
	
func stop_typing() -> void:
	typing_sound.stop()

func _on_text_delay_timeout() -> void:
	currline += 1
	if currline == 1:
		textanimator.play("show1")
	elif currline == 2:
		textanimator.play("show2")
	elif currline == 3:
		textanimator.play("show3")
	elif currline == 4:
		textanimator.play("show4")
	elif currline == 5:
		textanimator.play("continue")
		textisshown = true
