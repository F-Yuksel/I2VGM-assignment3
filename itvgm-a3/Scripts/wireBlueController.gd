extends Area2D

var ableToInterract: bool = false;
var isDragging: bool = false;

func _ready() -> void:
	$".".connect("mouse_entered", Callable(self, "_on_body_entered"))
	$".".connect("mouse_exited", Callable(self, "_on_body_exited"))

func _process(delta: float) -> void:
	if ableToInterract and Input.is_action_just_pressed("ClickLeft"):
		isDragging = true
		
	if Input.is_action_just_released("ClickLeft"):
		isDragging = false
		
	if isDragging:
		var mouse_y = get_viewport().get_mouse_position().y
		if mouse_y <= 205:
			$"./../b3-1".visible = true
			$"./../b3-2".visible = false
			$"./../b3-3".visible = false
			$"./../b3-4".visible = false
		elif mouse_y > 205 && mouse_y <= 328:
			$"./../b3-1".visible = false
			$"./../b3-2".visible = true
			$"./../b3-3".visible = false
			$"./../b3-4".visible = false
		elif mouse_y > 328 && mouse_y <= 448:
			$"./../b3-1".visible = false
			$"./../b3-2".visible = false
			$"./../b3-3".visible = true
			$"./../b3-4".visible = false
		else:
			$"./../b3-1".visible = false
			$"./../b3-2".visible = false
			$"./../b3-3".visible = false
			$"./../b3-4".visible = true
	
func _on_body_entered():
	ableToInterract = true
		
func _on_body_exited():
	ableToInterract = false