extends Area2D

var playerName: String = "Player";
var ableToInterract: bool = false;
@onready var alarm: AudioStreamPlayer = $"../alarm"
@onready var reactor_start: AudioStreamPlayer = $"../reactorStart"
var alarmState: bool = false

var timerBase = 26
var timer = timerBase

func _ready() -> void:
	set_process(true)
	$".".connect("body_entered", Callable(self, "_on_body_entered"));
	$".".connect("body_exited", Callable(self, "_on_body_exited"));		
	
	if !Global.reactorOn:
		alarm.play()
	else:
		alarm.stop()
		reactor_start.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	queue_redraw()
	timer -= 1
	if (timer < 0):
		timer = timerBase
		alarmState = !alarmState
		
	if ableToInterract and Input.is_action_just_pressed("Interact"):
		get_tree().change_scene_to_file("res://Scenes/Levels/reactor/reactorStartUpSequence.tscn")
	
func _on_body_entered(body):
	if body.name == playerName:
		if !Global.generatorOn:
			$"../Player/noPower".visible = true
		else:
			$"../Player/Interact".visible = true
			ableToInterract = true
		
func _on_body_exited(body):
	if body.name == playerName:
		ableToInterract = false
		$"../Player/Interact".visible = false
		$"../Player/noPower".visible = false
	
func _draw():
	if !Global.reactorOn and alarmState:
		var rect_position = Vector2(-128, -288)
		var rect_size = Vector2(1215, 255)
		var rectColor = Color(1, 0, 0, .25)
		draw_rect(Rect2(rect_position, rect_size), rectColor)
