extends Area2D

var ableToInterract: bool = false
var circleNumber = 1

func _ready() -> void:
	$".".connect("mouse_entered", Callable(self, "_on_body_entered"))
	$".".connect("mouse_exited", Callable(self, "_on_body_exited"))
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _process(delta: float) -> void:
	if ableToInterract and Input.is_action_just_pressed("ClickLeft"):
		$"./..".visible = false
		var itemString = "./../../" + str(circleNumber)
		var targetNode = get_node(itemString)
		
		if targetNode:
			targetNode.sequenceRunning = true
		
	
func _on_body_entered():
	ableToInterract = true
	
func _on_body_exited():
	ableToInterract = false
