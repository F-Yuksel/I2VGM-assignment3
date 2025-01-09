extends Node

var currline = 0
var textisshown = false

@onready var textanimator: AnimationPlayer = $"../TextAnimator"
@onready var onload: Timer = $"../onload"
@onready var text_delay: Timer = $"../TextDelay"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	textanimator.play("onload")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if textisshown and Input.is_action_just_pressed("Jump"):
		get_tree().change_scene_to_file("res://Scenes/Levels/test_scene.tscn")


func start_textdelay() -> void:
	text_delay.start()

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
