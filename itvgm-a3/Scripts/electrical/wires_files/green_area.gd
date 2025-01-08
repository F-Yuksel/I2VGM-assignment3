extends Area2D

var ableToInterract: bool = false;
var isDragging: bool = false;
var correct: bool = false;

func _ready() -> void:
	$".".connect("mouse_entered", Callable(self, "_on_body_entered"))
	$".".connect("mouse_exited", Callable(self, "_on_body_exited"))
	#$"../g-4".visible = false
	#$"../g-3".visible = false
	#$"../g-2".visible = false
	#$"../g-1".visible = false

func _process(delta: float) -> void:
	#if not ableToInterract and not correct:
		#$"../g-4".visible = false
		#$"../g-3".visible = false
		#$"../g-2".visible = false
		#$"../g-1".visible = false
		#
	#if $"../g-4".visible:
		#correct = true
		
	if ableToInterract and Input.is_action_just_pressed("ClickLeft"):
		isDragging = true
		
	if Input.is_action_just_released("ClickLeft"):
		isDragging = false
		
	if isDragging:
		var mouse_y = get_viewport().get_mouse_position().y
		if mouse_y <= 205:
			$"../g-4".visible = true
			$"../g-3".visible = false
			$"../g-2".visible = false
			$"../g-1".visible = false
		elif mouse_y > 205 && mouse_y <= 328:
			$"../g-4".visible = false
			$"../g-3".visible = true
			$"../g-2".visible = false
			$"../g-1".visible = false
		elif mouse_y > 328 && mouse_y <= 448:
			$"../g-4".visible = false
			$"../g-3".visible = false
			$"../g-2".visible = true
			$"../g-1".visible = false
		else:
			$"../g-4".visible = false
			$"../g-3".visible = false
			$"../g-2".visible = false
			$"../g-1".visible = true
	
func _on_body_entered():
	ableToInterract = true
		
func _on_body_exited():
	ableToInterract = false
