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
	$".".connect("body_entered", Callable(self, "_on_body_entered"))
	$".".connect("body_exited", Callable(self, "_on_body_exited"))
	alarm_flash_loop()
	if !Global.reactorOn:
		alarm.play()
	else:
		alarm.stop()
		reactor_start.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ableToInterract and Input.is_action_just_pressed("Interact"):
		get_tree().change_scene_to_file("res://Scenes/Levels/reactor/reactorStartUpSequence.tscn")
	
func alarm_flash_loop():
	if !Global.reactorOn:
		queue_redraw()
		await get_tree().create_timer(0.4).timeout
		alarmState = !alarmState
		alarm_flash_loop()
	else:
		alarmState = false
	
func _on_body_entered(body):
	if body.name == playerName:
		if !Global.generatorOn:
			$"../Player/CanvasLayer/noPower".visible = true
		else:
			$"../Player/CanvasLayer/Interact".visible = true
			ableToInterract = true
		
func _on_body_exited(body):
	if body.name == playerName:
		ableToInterract = false
		$"../Player/CanvasLayer/Interact".visible = false
		$"../Player/CanvasLayer/noPower".visible = false
	
func _draw():
	if !Global.reactorOn and alarmState:
		var rect_position = Vector2(-128, -288)
		var rect_size = Vector2(1215, 255)
		var rectColor = Color(1, 0, 0, .25)
		draw_rect(Rect2(rect_position, rect_size), rectColor)
