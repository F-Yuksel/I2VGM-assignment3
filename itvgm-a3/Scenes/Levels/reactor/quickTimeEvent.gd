extends Node2D

var sequenceRunning: bool = false
var circleRadius = 75
var circleColor = Color(0.298, 0.659, 0.651, 1)

var xPos
var yPos

func _ready() -> void:
	xPos = randf_range(100, 1050)
	yPos = randf_range(100, 550)
	set_process(true)

func _process(delta):
	circleRadius -= 40 * delta
	circleColor = Color(circleColor.r, circleColor.g, circleColor.b, circleColor.a-0.5*delta)
	queue_redraw()

func _draw() -> void:
	if sequenceRunning:
		draw_circle(Vector2(xPos, yPos), circleRadius, circleColor)
		if circleRadius <= 0:
			get_tree().change_scene_to_file("res://Scenes/Levels/reactor/reactorroom.tscn")
			Global.doorPosition = Vector2(752, -60)
		

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var click_position = event.position
		var circle_position = Vector2(xPos, yPos)
		circleRadius = 75
		circleColor = Color(0.298, 0.659, 0.651, 1)
		if sequenceRunning and click_position.distance_to(circle_position) <= circleRadius:
			_on_circle_pressed()

func _on_circle_pressed() -> void:
	sequenceRunning = false
	$"./../StartButton/Button".circleNumber +=1
	
	if $"./../StartButton/Button".circleNumber == 20:
		Global.doorPosition = Vector2(752, -60)
		Global.reactorOn = true
		get_tree().change_scene_to_file("res://Scenes/Levels/reactor/reactorroom.tscn")
	
	var itemString = "./../" + str($"./../StartButton/Button".circleNumber)
	var targetNode = get_node(itemString)
	
	if targetNode:
		targetNode.sequenceRunning = true
