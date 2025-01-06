extends Area2D

var ableToInterract: bool = false;
var isDragging: bool = false;

func _ready() -> void:
	$".".connect("mouse_entered", Callable(self, "_on_body_entered"))
	$".".connect("mouse_exited", Callable(self, "_on_body_exited"))

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
		Global.doorPosition = Vector2(375, 0)
		get_tree().change_scene_to_file("res://Scenes/Levels/reactor/LQ3.tscn")
		
	if ableToInterract and Input.is_action_just_pressed("ClickLeft"):
		isDragging = true
		
	if Input.is_action_just_released("ClickLeft"):
		isDragging = false
		
	if isDragging:
		var mouse_y = get_viewport().get_mouse_position().y
		if mouse_y <= 205:
			$"./../p4-1".visible = true
			$"./../p4-2".visible = false
			$"./../p4-3".visible = false
			$"./../p4-4".visible = false
		elif mouse_y > 205 && mouse_y <= 328:
			$"./../p4-1".visible = false
			$"./../p4-2".visible = true
			$"./../p4-3".visible = false
			$"./../p4-4".visible = false
		elif mouse_y > 328 && mouse_y <= 448:
			$"./../p4-1".visible = false
			$"./../p4-2".visible = false
			$"./../p4-3".visible = true
			$"./../p4-4".visible = false
		else:
			$"./../p4-1".visible = false
			$"./../p4-2".visible = false
			$"./../p4-3".visible = false
			$"./../p4-4".visible = true
			
	if finished():
		Global.generatorOn = true
		Global.doorPosition = Vector2(375, 0)
		get_tree().change_scene_to_file("res://Scenes/Levels/reactor/LQ3.tscn")
			
func finished() -> bool:
	return ($"./../p4-2".visible && 
			$"./../../Red/r1-3".visible && 
			$"./../../Green/g2-1".visible && 
			$"./../../Blue/b3-4".visible && 
			!isDragging)
	
func _on_body_entered():
	ableToInterract = true
		
func _on_body_exited():
	ableToInterract = false
