extends Area2D

var ableToInterract: bool = false;
var isDragging: bool = false;
var correct: bool = false
@onready var wireSFX: AudioStreamPlayer = $"../../../Wire"

func _ready() -> void:
	$".".connect("mouse_entered", Callable(self, "_on_body_entered"))
	$".".connect("mouse_exited", Callable(self, "_on_body_exited"))
	if Global.elecwires_solved:
		$"../p-2".visible = true
		$"../../Red/r-1".visible = true
		$"../../Green/g-4".visible = true
		$"../../Blue/b-2".visible = true

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
		Global.doorPosition = Vector2(63, -192)
		get_tree().change_scene_to_file("res://Scenes/Levels/electrical/electrical_wires.tscn")
		
	if ableToInterract and Input.is_action_just_pressed("ClickLeft"):
		isDragging = true
		
	if Input.is_action_just_released("ClickLeft"):
		isDragging = false
		
	if isDragging:
		var mouse_y = get_viewport().get_mouse_position().y
		if mouse_y <= 205:
			$"../p-1".visible = true
			$"../p-2".visible = false
			$"../p-3".visible = false
			$"../p-4".visible = false
			wireSFX.play()
		elif mouse_y > 205 && mouse_y <= 328:
			$"../p-1".visible = false
			$"../p-2".visible = true
			$"../p-3".visible = false
			$"../p-4".visible = false
			wireSFX.play()
		elif mouse_y > 328 && mouse_y <= 448:
			$"../p-1".visible = false
			$"../p-2".visible = false
			$"../p-3".visible = true
			$"../p-4".visible = false
			wireSFX.play()
		else:
			$"../p-1".visible = false
			$"../p-2".visible = false
			$"../p-3".visible = false
			$"../p-4".visible = true
			wireSFX.play()
			
	if finished():
		Global.elecwires_solved = true
			
func finished() -> bool:
	return ($"../p-2".visible && 
			$"../../Red/r-1".visible && 
			$"../../Green/g-4".visible && 
			$"../../Blue/b-2".visible &&
			!isDragging)
	
func _on_body_entered():
	ableToInterract = true
		
func _on_body_exited():
	ableToInterract = false
